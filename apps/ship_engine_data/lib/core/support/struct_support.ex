defmodule Auctane.ShipEngineData.Core.Support.StructSupport do
  @moduledoc "Support functions for handling structs"

  @doc """
  Converts a map with string keys to a map with atom keys

  ## Resources

  NOTE: Someone in a recent interview criticized Elixir, or at least
  implementing developers, for making code unreadable by abusing the capture
  operator. This module uses named functions and is a longer (more readable?)
  form of the answer in the discussion at:
  https://stackoverflow.com/questions/30927635/in-elixir-how-do-you-initialize-a-struct-with-a-map-variable

  ## Examples

    iex> StructSupport.to_atom_keys(%Carrier{}, %{"nickname" => "Test Name", "carrier_id" => "1234"})
    %{
      account_number: nil,
      balance: nil,
      carrier_code: nil,
      carrier_id: "1234",
      friendly_name: nil,
      nickname: "Test Name",
      requires_funded_amount: nil
    }

  """
  @spec to_atom_keys(struct(), map()) :: map()
  def to_atom_keys(%module_name{}, data) do
    module_name.__struct__()
    |> Map.drop([:__struct__])
    |> Map.keys()
    |> Enum.reduce(%{}, &reduce_data_string_keys_to_atoms(&1, &2, data))
  end

  defp reduce_data_string_keys_to_atoms(atom_key, acc, data) do
    string_field = Atom.to_string(atom_key)
    string_field_value = Map.get(data, string_field)
    Map.put(acc, atom_key, string_field_value)
  end
end
