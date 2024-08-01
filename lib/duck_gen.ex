defmodule DuckGen do
  alias Utils.Optimus, as: Optimus
  alias Constants.Options, as: Options
  alias Utils.Available, as: Available

  def main(args) do
    # Optimus.optimus(args)

    type =
      Available.pick_side(Options.project_types())

    Available.available_stacks(type)

    # |> generate()
  end
end

# DuckGen.main(System.argv())
