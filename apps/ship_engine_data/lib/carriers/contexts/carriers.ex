defmodule Auctane.ShipEngineData.Carriers.Carriers do
  @moduledoc false

  alias Auctane.ShipEngineData.Carriers.Carrier
  alias Auctane.ShipEngineData.Carriers.Services.CarrierService

  @doc """
  Retrieves a list of carriers

  Returns a list of structs in an :ok tuple, or formats any errors and returns
  an :error tuple.
  """
  @spec list_carriers() :: {:ok, [Carrier.t()]} | {:error, any()}
  def list_carriers, do: CarrierService.list_carriers_stub()
end
