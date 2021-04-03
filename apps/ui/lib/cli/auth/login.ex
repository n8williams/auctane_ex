defmodule Auctane.Ui.Cli.Auth.Login do
  @moduledoc """
  Handle the interaction with users from the Command Line Interface for
  interacting with inputs for logging the user in.
  """

  # alias Auctane.ShipEngineData.Carriers.Carriers

  @doc "Log the user in"
  @spec login_cli() :: :ok
  def login_cli do
    IO.gets("Enter API Key:")
  end
end
