defmodule DuckGen do
  alias Utils
  alias Utils.Optimus, as: Optimus

  def main(args) do
    Optimus.optimus(args)
    |> IO.inspect()
  end

  def parse_args(args) do
    {opts, _rest, _invalid} =
      OptionParser.parse(args,
        switches: [
          name: :string,
          language: :string,
          framework: :string,
          style: :string,
          context: :string
        ]
      )

    opts
  end

  def generate(opts) do
    name = generate_file(opts[:name])
    IO.inspect(name)
    # case opts[:language] do
    #   "typescript" ->
    # end
  end

  def generate_file(name) do
    case Utils.upsert_folder(name) do
      :ok ->
        IO.inspect(~c"hi")

      :error ->
        IO.puts("Error: The folder '#{name}' already exists.")
    end

    # if name do
    #   IO.inspect(~c"hi")
    # end

    # with {:ok, :error} <-
    #        File.mkdir_p(name) do
    #   File.write(name, "hello world")
    # end
    #
    # IO.inspect(name, :ok, :error)
  end
end
