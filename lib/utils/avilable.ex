defmodule Utils.Avilable do
  alias Constants.Options
  alias Utils.BuildProject, as: BuildProject


  def available_stacks(type) do
    case type do
      "Web" ->
        pick_side(Options.project_stack_types())
        |> available_technologies()

      _ ->
        []
    end
  end

  def available_technologies(stack_type) do
    case stack_type do
      "Frontend" ->
        ~c"hi"

      "Backend" ->
        pick_side(Options.backend_technologies())
        |> available_backend_technologies()

      "Fullstack" ->
        Options.fullstack_technologies()

      _ ->
        []
    end
  end

  def available_backend_technologies(stack_technology) do
    case stack_technology do
      "Nodejs" ->
        pick_side(Options.nodejs_technologies())
        |> available_nodejs_technologies()

      _ ->
        []
    end
  end

  def available_nodejs_technologies(stack_technology) do
    case stack_technology do
      "ExpressJS" ->
        BuildProject.build_project(["Web", "Backend", "Nodejs", "Express"])

      "NestJS" ->
        Options.nodejs_technologies()

      "Fastify" ->
        Options.nodejs_technologies()

      _ ->
        IO.inspect("no option has been selected")
    end
  end

  def pick_side(options) when is_function(options, 0) do
    pick_side(options.())
  end

  def pick_side(options) do
    for {lan, idx} <- Enum.with_index(options) do
      IO.puts("#{idx + 1}. #{lan}")
    end

    selected =
      IO.gets("Pick your type of project: ")
      |> String.trim()

    # Clear the screen
    IO.puts("\e[H\e[2J")

    selected_index = String.to_integer(selected) - 1
    Enum.at(options, selected_index)
  end
end
