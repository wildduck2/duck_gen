defmodule(Utils.Path) do

  @spec upsert_folder(String.t()) :: :ok | {:error, any}
  def upsert_folder(path) do
    normalized_path = Path.expand(path)

    if File.exists?(normalized_path) do
      :error
    else
      case File.mkdir_p(normalized_path) do
        :ok ->
          IO.inspect(~c"project folder created successfully")

        {:error, _} ->
          IO.puts("Error: The folder '#{path}' already exists.")
      end
    end
  end

  def init_file_content(project_dir, file_name, file_content) do
    package_json_path = Path.join(project_dir, file_name)

    case File.write(package_json_path, file_content) do
      :ok ->
        IO.puts("#{file_name} file created successfully.")

      {:error, reason} ->
        IO.puts("Failed to create #{file_name} file: #{reason}")
    end
  end
end
