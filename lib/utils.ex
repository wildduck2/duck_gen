defmodule Utils do
  @spec insure_exists(String.t()) :: String.t() | :ok
  def insure_exists(path) do
    if File.exists?(path) do
      path
    else
      File.mkdir_p!(path)
    end
  end

  @spec upsert_folder(String.t()) :: :ok | {:error, any}
  def upsert_folder(path) do
    if File.exists?(path) do
      :error
    else
      case File.mkdir_p(path) do
        :ok ->
          :ok

        {:error, reason} ->
          {:error, reason}
      end
    end
  end
end
