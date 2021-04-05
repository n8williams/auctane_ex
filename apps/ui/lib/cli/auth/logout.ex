defmodule Auctane.Ui.Cli.Auth.Logout do
  @moduledoc """
  Handle the CLI interaction with users for interacting with inputs for logging
  the user out.
  """

  alias Auctane.ShipEngineData.Auth.FileStorage, as: AuthFileStorage
  alias Auctane.ShipEngineData.Auth.SessionStorage, as: AuthSessionStorage

  @doc "Log the user out"
  @spec logout_cli() :: :ok
  def logout_cli do
    AuthFileStorage.clear_key!()
    AuthSessionStorage.clear()
    IO.puts("You are no longer logged in to ShipEngine")
  end
end
