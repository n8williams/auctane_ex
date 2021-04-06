defmodule Auctane.Ui.Cli.Carriers.Carriers do
  @moduledoc """
  Handle the CLI interaction with users for interacting with data for Carriers.
  """

  alias Auctane.ShipEngineData.Carriers.Contexts.Carriers
  alias Auctane.ShipEngineData.Carriers.Schema.Carrier

  @doc "Output all carriers for a user to the CLI"
  @spec carriers_cli() :: :ok
  def carriers_cli do
    case Carriers.list_carriers() do
      {:ok, carriers} -> output_carriers(carriers)
      {:error, error} -> error |> output_carrier_error() |> IO.puts()
    end
  end

  @doc """
  Output an error for listing (doctest)

  ## Examples

    iex>format_carrier(%Carrier{carrier_id: "42", friendly_name: "Sam Hall"})
    "- Sam Hall (42)"
  """
  @spec format_carrier(Carrier.t()) :: String.t()
  def format_carrier(carrier), do: "- #{carrier.friendly_name} (#{carrier.carrier_id})"

  defp output_carriers(carriers) do
    IO.puts("\nYou have #{Enum.count(carriers)} carrier accounts connected:\n")
    for c <- carriers, do: IO.puts(format_carrier(c))
    IO.puts("")
  end

  defp output_carrier_error(error_string),
    do:
      "Error retrieving your carrier list: #{error_string}" <>
        ". Please ensure you are logged in with the correct api key."
end
