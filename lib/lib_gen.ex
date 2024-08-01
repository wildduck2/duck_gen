defmodule DuckGen do
  alias Utils.Path, as: Path
  alias Utils.Optimus, as: Optimus

  def main(args) do
    Optimus.optimus(args)
    |> generate()
  end

  defp generate(opts) do
    %{args: args} = opts

    case args[:language] do
      "typescript" ->
        Path.upsert_folder(args[:project_dir])
        generate_project_files(args[:project_dir])

      _ ->
        IO.puts("Language not specified or unsupported")
    end
  end

  defp generate_project_files(project_dir) do
    IO.puts("Initializing npm project in the created directory...")

    package_name =
      IO.gets("what do you want to name your project? :")
      |> String.trim()

    package_description =
      IO.gets("what do you want to describe your project? :")
      |> String.trim()

    package_auther =
      IO.gets("what is your name? :")
      |> String.trim()

    Path.init_package_json_file(package_name, package_description, package_auther, project_dir)
  end
end
