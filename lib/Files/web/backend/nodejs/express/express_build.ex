defmodule Files.Web.Backend.Nodejs.Express.ExpressBuild do
  alias Files.Web.Backend.Nodejs.Zod, as: Zod
  alias Files.Web.Backend.Nodejs.Types, as: Types
  alias Files.Web.Backend.Nodejs.Prisma, as: Prisma
  alias Files.Web.Backend.Nodejs.Config, as: Config
  alias Files.Web.Backend.Nodejs.Env, as: Env
  alias Constants.FilesContent, as: FilesContent
  alias Utils.Path

  def build_expressjs(project_dir) do
    IO.puts("\n Initializing npm project in the created directory...")

    Path.upsert_folder(project_dir)
    Path.init_file_content(project_dir, "package.json", FilesContent.package_json_content())
    Path.init_file_content(project_dir, "tsconfig.json", FilesContent.tsconfig_json_content())
    Path.init_file_content(project_dir, "biome.config.json", FilesContent.biome_config_content())
    Path.upsert_folder("#{project_dir}/src")
    Path.upsert_folder("#{project_dir}/prisma")
    Path.upsert_folder("#{project_dir}/src/zod")
    Path.upsert_folder("#{project_dir}/src/zod/user")
    Path.upsert_folder("#{project_dir}/src/types")
    Path.upsert_folder("#{project_dir}/src/config")
    Path.upsert_folder("#{project_dir}/src/constants")

    # Path.upsert_folder("#{project_dir}/src/models")
    # Path.upsert_folder("#{project_dir}/src/services")
    # Path.upsert_folder("#{project_dir}/src/controllers")
    # Path.upsert_folder("#{project_dir}/src/routes")
    # Path.upsert_folder("#{project_dir}/src/utils")

    Path.init_file_content(
      "#{project_dir}/prisma/",
      "schema.prisma",
      Prisma.prisma_schema_content("mysql")
    )

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

    Path.init_file_content(
      "#{project_dir}/src/types/",
      "index.d.ts",
      Types.express_types_index()
    )

    Path.init_file_content(
      "#{project_dir}/src/config/",
      "index.ts",
      Config.config_ts_content()
    )

    Path.init_file_content(
      "#{project_dir}/",
      ".env",
      Env.env_ts_content()
    )

    # Pnpm.add_libs(project_dir, LibsInstall.dependencies())
    # Pnpm.add_libs(project_dir, LibsInstall.save_exact())
    # Pnpm.add_libs(project_dir, LibsInstall.dev_dependencies())

    System.halt(0)
    ~c"sdfaf"
  end
end
