defmodule LibGen.MixProject do
  use Mix.Project

  def project do
    [
      app: :lib_gen,
      version: "0.1.0",
      elixir: "~> 1.17-rc",
      escript: [main_module: DuckGen],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:optimus, "~> 0.2"},
      {:owl, "~> 0.11.0"},
      {:ucwidth, "~> 0.2"}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
