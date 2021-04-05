defmodule Auctane.ShipEngineData.Auth.Support do
  @moduledoc "Shared functionality for the auth modules"

  @doc "The file to use for storing a user's API key"
  @spec api_key_file_path() :: String.t()
  def api_key_file_path, do: Path.expand("../../priv", __DIR__) <> "/user_api_key.txt"
end
