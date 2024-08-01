defmodule Utils do
  @spec insure_exists(String.t()) :: String.t() | :ok
  def insure_exists(path) do
    if File.exists?(path) do
      path
    else
      File.mkdir_p!(path)
    end
  end
end
