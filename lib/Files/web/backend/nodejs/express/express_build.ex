defmodule Files.Web.Backend.Nodejs.Express.ExpressBuild do
  alias Utils.Path, as: Path
  alias Constants.Options, as: Options
  alias Utils.Available, as: Available
  alias Constants.LibsInstall, as: LibsInstall
  alias Utils.Pnpm, as: Pnpm
  alias Files.Web.Backend.Nodejs.Zod, as: Zod
  alias Files.Web.Backend.Nodejs.Types, as: Types
  alias Files.Web.Backend.Nodejs.Prisma, as: Prisma
  alias Files.Web.Backend.Nodejs.Config, as: Config
  alias Files.Web.Backend.Nodejs.Env, as: Env
  alias Files.Web.Backend.Nodejs.Constants, as: Constants
  alias Files.Web.Backend.Nodejs.LibConfigs, as: LibConfigs
  alias Files.Web.Backend.Nodejs.ProjectMainIndexFile, as: ProjectMainIndexFile
  alias Files.Web.Backend.Nodejs.Controllers, as: Controllers
  alias Files.Web.Backend.Nodejs.Services, as: Services
  alias Files.Web.Backend.Nodejs.Routes, as: Routes
  alias Files.Web.Backend.Nodejs.Utils, as: Utils
  alias Files.Web.Backend.Nodejs.MySQL, as: MySQL
  alias Files.Web.Backend.Nodejs.Middleware, as: Middleware
  alias Files.Web.Backend.Nodejs.Models, as: Models

  def build_expressjs(project_dir) do
    IO.puts("\n Initializing npm project in the created directory...")

    backend_design = Available.pick_side(Options.backend_design_patterns())
    database_type = Available.pick_side(Options.database_types())
    orm_or_not = IO.gets("Do you want to use ORM? (y/n) : ") |> String.trim()

    Path.upsert_folder(project_dir)
    Path.init_file_content(project_dir, "package.json", LibConfigs.package_json_content())
    Path.init_file_content(project_dir, "tsconfig.json", LibConfigs.tsconfig_json_content())
    Path.init_file_content(project_dir, "biome.config.json", LibConfigs.biome_config_content())
    Path.upsert_folder("#{project_dir}/src")

    case backend_design do
      "REST" ->
        build_rest(project_dir)

      _ ->
        IO.inspect("no option has been selected")
    end

    orm = Available.pick_side(Options.orms())

    case database_type do
      "MySQL" ->
        build_mysql(project_dir, orm, orm_or_not)

      _ ->
        IO.inspect("no option has been selected")
    end

    Pnpm.add_libs(project_dir, LibsInstall.dependencies())
    Pnpm.add_libs(project_dir, LibsInstall.save_exact())
    Pnpm.add_libs(project_dir, LibsInstall.dev_dependencies())

    System.halt(0)
    ~c"sdfaf"
  end

  def build_rest(project_dir) do
    Path.upsert_folder("#{project_dir}/src/types")
    Path.upsert_folder("#{project_dir}/src/config")
    Path.upsert_folder("#{project_dir}/src/constants")
    Path.upsert_folder("#{project_dir}/src/controllers")
    Path.upsert_folder("#{project_dir}/src/services")
    Path.upsert_folder("#{project_dir}/src/routes")
    Path.upsert_folder("#{project_dir}/src/utils")
    Path.upsert_folder("#{project_dir}/src/middleware")
    Path.upsert_folder("#{project_dir}/src/zod")

    Path.init_file_content(
      "#{project_dir}/src/zod/",
      "index.ts",
      Zod.zod_index_ts_content()
    )

    Path.init_file_content(
      "#{project_dir}/prisma/",
      "schema.prisma",
      Prisma.prisma_schema_content("mysql")
    )

    Path.init_file_content(
      "#{project_dir}/src/",
      "index.ts",
      ProjectMainIndexFile.index_ts_content()
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

    Path.init_file_content(
      "#{project_dir}/src/constants/",
      "index.ts",
      Constants.constants_index_ts_content()
    )

    Path.init_file_content(
      "#{project_dir}/src/constants/",
      "config.ts",
      Constants.constants_config_ts_content()
    )

    Path.init_file_content(
      "#{project_dir}/src/controllers/",
      "index.ts",
      Controllers.controllers_index_ts_content()
    )

    Path.init_file_content(
      "#{project_dir}/src/services/",
      "index.ts",
      Services.services_index_ts_content()
    )

    Path.init_file_content(
      "#{project_dir}/src/routes/",
      "index.ts",
      Routes.routes_index_ts_content()
    )

    Path.init_file_content(
      "#{project_dir}/src/utils/",
      "index.ts",
      Utils.utils_index_ts_content()
    )

    Path.init_file_content(
      "#{project_dir}/src/middleware/",
      "index.ts",
      Middleware.middleware_index_ts_content()
    )
  end

  def build_mysql(project_dir, orm, orm_or_not) do
    if orm_or_not == "y" do
      case orm do
        "Prisma" ->
          Path.upsert_folder("#{project_dir}/prisma")

          Path.init_file_content(
            "#{project_dir}/prisma/",
            "schema.prisma",
            Prisma.prisma_schema_content("mysql")
          )

          Pnpm.add_libs(project_dir, ["--save-dev", "prisma"])

        _ ->
          IO.inspect("no option has been selected")
      end
    else
      Path.upsert_folder("#{project_dir}/src/models")

      Path.init_file_content(
        "#{project_dir}/src/models/",
        "index.ts",
        Models.models_index_ts_content()
      )

      Path.upsert_folder("#{project_dir}/src/MySQL")

      Path.init_file_content(
        "#{project_dir}/src/MySQL/",
        "index.ts",
        MySQL.mysql_ts_content()
      )

      Pnpm.add_libs(project_dir, ["--save-dev", "mysql3"])
    end
  end
end
