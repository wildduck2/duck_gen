defmodule Utils.Optimus do
  def optimus(argv) do
    Optimus.new!(
      name: "duck_gen",
      description: "Generate any freamework poilerplate",
      version: "0.0.1",
      author: "ahmed ayob ahmedayob@gmail.com",
      about: "it's a generator of any freamework poilerplate. it's like a boilerplate generator",
      allow_unknown_args: false,
      parse_double_dash: true,
      args: [
        project_dir: [
          value_name: "PROJECT_DIR",
          help: "Specify the project directory",
          require: true,
          parser: :string
        ],
        language: [
          value_name: "LANGUAGE",
          help: "Specify the language of the poilerplate",
          require: true,
          parser: :string
        ]
      ],
      flags: [],
      options: [],
      subcommands: []
    )
    |> Optimus.parse!(argv)
  end

  defmodule ParseResult do
    defstruct args: %{}, flags: %{}, options: %{}, unknown: []
  end

  def generate(%ParseResult{args: args}) do
    IO.inspect(args)

    case args[:language] do
      "typescript" ->
        IO.puts("Handling TypeScript generation")

      _ ->
        IO.puts("Language not specified or unsupported")
    end
  end
end
