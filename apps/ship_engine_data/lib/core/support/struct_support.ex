defmodule Auctane.ShipEngineData.Core.Support.StructSupport do
  @doc """
  Converts a map with string keys to a map with atom to_atom_keys

  ## Resources
  NOTE: Someone in a recent interview criticized Elixir, or at least
  implementing developers, for making code unreadable by abusing the capture
  operator. This form uses named functions and is a longer (more readable?)
  form of the answer in the discussion at:
  https://stackoverflow.com/questions/30927635/in-elixir-how-do-you-initialize-a-struct-with-a-map-variable

  ## Examples

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
