defmodule Auctane.Ui.Cli.Carriers do
  alias Auctane.ShipEngineData.Carriers.Carriers

  @moduledoc """
  Handle the interaction with users from the Command Line Interface for
  interacting with data for Carriers.
  """

  @doc "List all carriers"
  @spec carriers_cli() :: any()
  def carriers_cli(), do: Carriers.list_carriers()
end
