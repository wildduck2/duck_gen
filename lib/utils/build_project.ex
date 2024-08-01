defmodule Utils.BuildProject do
  alias Files.Web.Backend.Nodejs.Express, as: Express

  def build_project(opts) do
    IO.puts("now let's start with the project build.")
    continue = IO.gets("do you want to continue? (y/n) : ") |> String.trim()

    IO.inspect(continue)

    case continue do
      "y" ->
        build_project_files(opts)

      _ ->
        IO.puts("now let's start with cusomizing the project build.")
    end
  end

  def build_project_files(opts) do
    case opts do
      ["Web", "Backend", "Nodejs", "Express"] ->
        IO.gets("what you gonna name the project? : ")
        |> String.trim()
        |> Express.ExpressBuild.build_expressjs()

      _ ->
        []
    end
  end
end
