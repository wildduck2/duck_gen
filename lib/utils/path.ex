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

  def init_package_json_file(package_name, package_description, package_auther, project_dir) do
    package_json_content = """
    {
      "name": "#{package_name}",
      "version": "0.0.0",
      "description": "#{package_description}",
      "repository": {
        "type": "git",
        "url": "git+https://github.com/your/repo.git"
      },
      "author": "#{package_auther}",
      "license": "MIT"
    }
    """

    package_json_path = Path.join(project_dir, "package.json")

    case File.write(package_json_path, package_json_content) do
      :ok ->
        IO.puts("package.json file created successfully.")

      {:error, reason} ->
        IO.puts("Failed to create package.json file: #{reason}")
    end
  end
end
