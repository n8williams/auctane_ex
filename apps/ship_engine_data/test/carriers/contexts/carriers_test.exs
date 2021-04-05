defmodule Auctane.ShipEngineData.Carriers.Contexts.CarriersTest do
  use ExUnit.Case

  alias Auctane.ShipEngineData.Carriers.Contexts.Carriers
  alias Auctane.ShipEngineData.Carriers.Schema.Carrier

  test "list_carriers/0" do
    {:ok, [first_carrier | _tail]} = Carriers.list_carriers()
    assert match?(%Carrier{}, first_carrier)
  end
end
