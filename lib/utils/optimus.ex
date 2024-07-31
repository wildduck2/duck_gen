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
        language: [
          value_name: "LANGUAGE",
          help: "Specify the language of the poilerplate",
          require: false,
          parser: :string
        ]
      ],
      flags: [],
      options: [],
      subcommands: []
    )
    |> Optimus.parse!(argv)
  end
end
