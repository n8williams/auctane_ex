defmodule Auctane.ShipEngineData.Carriers.Services.CarrierServiceTest do
  use ExUnit.Case

  alias Auctane.ShipEngineData.Carriers.Schema.Carrier
  alias Auctane.ShipEngineData.Carriers.Services.CarrierService

  describe "list_carriers/0" do
    test "An expected result is retrieved" do
      {:ok, [first_carrier | _tail]} = CarrierService.list_carriers()
      assert match?(%Carrier{}, first_carrier)
    end

    test "An expected error occurs for an invalid api key" do
      begin_env = System.get_env("TEST_SHIP_ENGINE_API_KEY")
      System.put_env("TEST_SHIP_ENGINE_API_KEY", "42")
      subject = CarrierService.list_carriers()
      assert {:error, _err} = subject
      System.put_env("TEST_SHIP_ENGINE_API_KEY", begin_env)
    end

    test "An expected error occurs for an invalid url" do
      begin_env = System.get_env("TEST_SHIP_ENGINE_API_KEY")
      System.put_env("TEST_SHIP_ENGINE_API_KEY", "42")
      subject = CarrierService.list_carriers()
      assert {:error, _err} = subject
      System.put_env("TEST_SHIP_ENGINE_API_KEY", begin_env)
    end
  end
end
