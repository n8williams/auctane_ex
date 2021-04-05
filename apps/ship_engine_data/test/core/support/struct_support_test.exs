defmodule Auctane.ShipEngineData.Core.Support.StructSupportTest do
  use ExUnit.Case

  alias Auctane.ShipEngineData.Carriers.Schema.Carrier
  alias Auctane.ShipEngineData.Core.Support.StructSupport

  doctest StructSupport

  describe "to_atom_keys/2" do
    test "Given a module name in place of a struct" do
      params = %{"nickname" => "Test Name"}

      # NOTE: In practice I would probably write a funtion head in the support
      # module that matches this case.
      assert_raise FunctionClauseError, fn ->
        StructSupport.to_atom_keys(Carrier, params)
      end
    end

    test "Given a map of params with a single field" do
      params = %{"nickname" => "Test Name"}
      expected = load_defaults(%{nickname: "Test Name"})
      subject = StructSupport.to_atom_keys(%Carrier{}, params)
      assert expected == subject
    end

    test "Given a map of params with a multiple fields" do
      params = %{"nickname" => "Test Name", "carrier_id" => "1234"}
      subject = StructSupport.to_atom_keys(%Carrier{}, params)
      expected = load_defaults(%{nickname: "Test Name", carrier_id: "1234"})
      assert expected == subject
    end

    test "Given a map of params with a extra fields" do
      params = %{"nickname" => "Test Name", "carrier_id" => "1234", "other_field" => 42}
      subject = StructSupport.to_atom_keys(%Carrier{}, params)
      expected = load_defaults(%{nickname: "Test Name", carrier_id: "1234"})
      assert expected == subject
    end

    test "Given a map of params with a nested fields" do
      params = %{
        "nickname" => "Test Name",
        "carrier_id" => "1234",
        "services" => [
          %{"id" => "12345", "name" => "A name"},
          %{"id" => "123456", "name" => "A name 2"}
        ]
      }

      subject = StructSupport.to_atom_keys(%Carrier{}, params)
      expected = load_defaults(%{nickname: "Test Name", carrier_id: "1234"})
      assert expected == subject
    end
  end

  # Given a map, set the default fields from the `Carrier` struct.
  defp load_defaults(incoming_map) do
    %Carrier{}
    |> struct(incoming_map)
    |> Map.from_struct()
    |> Map.merge(incoming_map)
  end
end
