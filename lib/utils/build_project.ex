defmodule Utils.BuildProject do
  alias Constants.Files.Zod, as: Zod
  alias Constants.FilesContent
  alias Utils.Path

  def build_project(opts) do
    IO.puts("now let's start with the project build.")

    case IO.gets("we have some default configs for you, do you want to continue or cusomize
     it?(y/n)") do
      "y" ->
        build_project_files(opts)

      "n" ->
        IO.puts("now let's start with cusomizing the project build.")
    end
  end

  def build_project_files(opts) do
    case opts do
      ["Web", "Backend", "Nodejs", "Express"] ->
        IO.gets("what you gonna name the project? : ")
        |> build_ts_project_files()

      _ ->
        []
    end
  end

  def build_ts_project_files(project_dir) do
    IO.puts("Initializing npm project in the created directory...")

    Path.init_file_content(project_dir, "package.json", FilesContent.package_json_content())
    Path.init_file_content(project_dir, "tsconfig.json", FilesContent.tsconfig_json_content())
    Path.init_file_content(project_dir, "biome.config.json", FilesContent.biome_config_content())
    Path.upsert_folder("#{project_dir}/src")
    Path.upsert_folder("#{project_dir}/src/zod")
    Path.upsert_folder("#{project_dir}/src/zod/user")
    # Path.upsert_folder("#{project_dir}/src/types")
    # Path.upsert_folder("#{project_dir}/src/models")
    # Path.upsert_folder("#{project_dir}/src/services")
    # Path.upsert_folder("#{project_dir}/src/controllers")
    # Path.upsert_folder("#{project_dir}/src/routes")
    # Path.upsert_folder("#{project_dir}/src/config")
    # Path.upsert_folder("#{project_dir}/src/constants")
    # Path.upsert_folder("#{project_dir}/src/utils")

    Path.init_file_content(
      "#{project_dir}/src/",
      "index.ts",
      FilesContent.index_ts_content()
    )

    Path.init_file_content(
      "#{project_dir}/src/zod/",
      "index.ts",
      Zod.zod_index_ts_content()
    )

    Path.init_file_content(
      "#{project_dir}/src/zod/user/",
      "index.ts",
      Zod.zod_user_index_ts_content()
    )

    Path.init_file_content(
      "#{project_dir}/src/zod/user/",
      "user.ts",
      Zod.zod_user_user_ts_content()
    )

    Path.init_file_content(
      "#{project_dir}/src/zod/user/",
      "user.types.ts",
      Zod.zod_user_user_types_ts_content()
    )

    # Pnpm.add_libs(project_dir, LibsInstall.dependencies())
    # Pnpm.add_libs(project_dir, LibsInstall.save_exact())
    # Pnpm.add_libs(project_dir, LibsInstall.dev_dependencies())

    System.halt(0)
    ~c"sdfaf"
  end
end

