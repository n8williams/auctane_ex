defmodule Auctane.Ui.Cli.Auth.Logout do
  @moduledoc """
  Handle the interaction with users from the Command Line Interface for
  interacting with inputs for logging the user out.
  """

  # alias Auctane.ShipEngineData.Carriers.Contexts.Carriers

  @doc "Log the user out"
  @spec logout_cli() :: :ok
  def logout_cli do
    IO.puts("You are no longer logged in to ShipEngine")
  end
end
