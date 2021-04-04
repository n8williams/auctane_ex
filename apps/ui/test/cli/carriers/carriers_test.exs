defmodule Auctane.Ui.Cli.Carriers.Contexts.CarriersTest do
  use ExUnit.Case

  import Auctane.Ui.Cli.Carriers.Contexts.Carriers

  alias Auctane.Ui.Cli.Carriers.Contexts.Carriers
  doctest Carriers

  test "output_carriers/1" do
    # assert ShipEngineData.hello() == :world
  end

  # Or more ideally a factory from ex_machina or the like.
  # defp stub do
  #   [
  #     %Auctane.ShipEngineData.Carriers.Carrier{
  #       account_number: "test_account_578982",
  #       balance: 8507.28,
  #       carrier_code: "stamps_com",
  #       carrier_id: "se-578982",
  #       friendly_name: "Stamps.com",
  #       nickname: "ShipEngine Test Account - Stamps.com",
  #       requires_funded_amount: true
  #     },
  #     %Auctane.ShipEngineData.Carriers.Carrier{
  #       account_number: "test_account_578983",
  #       balance: 0.0,
  #       carrier_code: "ups",
  #       carrier_id: "se-578983",
  #       friendly_name: "UPS",
  #       nickname: "ShipEngine Test Account - UPS",
  #       requires_funded_amount: false
  #     },
  #     %Auctane.ShipEngineData.Carriers.Carrier{
  #       account_number: "test_account_578984",
  #       balance: 0.0,
  #       carrier_code: "fedex",
  #       carrier_id: "se-578984",
  #       friendly_name: "FedEx",
  #       nickname: "ShipEngine Test Account - FedEx",
  #       requires_funded_amount: false
  #     }
  #   ]
  # end
end
