defmodule Utils.Pnpm do
  def add_libs(project_dir, libs) do
    # Real-time output for pnpm install
    IO.puts("Starting dependency installation...")

    install_deps(project_dir, "pnpm", ["install" | libs])
    install_deps(project_dir, "pnpm", ["install", "--save-dev", "nodemon"])

    IO.puts("All dependencies installed successfully.")
  end

  defp install_deps(project_dir, command, args) do
    port =
      Port.open({:spawn_executable, System.find_executable(command)}, [
        :stderr_to_stdout,
        :binary,
        :exit_status,
        cd: project_dir,
        args: args
      ])

    loop_output(port)
  end

  defp loop_output(port) do
    receive do
      {^port, {:data, data}} ->
        IO.write(data)
        loop_output(port)

      {^port, {:exit_status, status}} ->
        case status do
          0 -> IO.puts("Process completed successfully.")
          _ -> IO.puts("Process failed with status: #{status}")
        end
    end
  end
end
