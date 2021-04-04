defmodule Auctane.Ui.Cli.Auth.AuthSupport do
  @moduledoc "Shared functionality for the cli auth modules"

  @doc "Log the user out"
  @spec api_key_file_path() :: String.t()
  def api_key_file_path, do: Path.expand("../../../priv", __DIR__) <> "/user_api_key.txt"
end
