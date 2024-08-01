defmodule DuckGen do
  # alias Constants.LibsInstall, as: LibsInstall
  alias Constants.Files.Zod, as: Zod
  alias Constants.FilesContent, as: FilesContent
  alias Constants.Options, as: Options
  # alias Utils.Optimus
  alias Utils.Path
  alias Utils.Avilable, as: Avilable
  # alias Utils.Pnpm

  def main(_args) do
    type =
      Avilable.pick_side(Options.project_types())

    Avilable.available_stacks(type)

    # stack_type =
    #
    # stack_technology = pick_side(Avilable.available_web_technologies(stack_type))
    # stack_framework = pick_side(Avilable.available_nodejs_technologies(stack_technology))

    # project_specs = [type, stack_type, stack_technology, stack_framework]

    IO.inspect(type)

    # Optimus.optimus(args)
    # |> generate()
  end

  # defp generate(opts) do
  #   %{args: args} = opts
  #
  #   case args[:language] do
  #     "typescript" ->
  #       Path.upsert_folder(args[:project_dir])
  #       generate_project_files(args[:project_dir])
  #
  #     _ ->
  #       IO.puts("Language not specified or unsupported")
  #   end
  #
  #   args
  # end
end

# DuckGen.main(System.argv())
