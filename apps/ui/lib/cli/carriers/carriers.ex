defmodule Auctane.Ui.Cli.Carriers.Contexts.Carriers do
  @moduledoc """
  Handle the interaction with users from the Command Line Interface for
  interacting with data for Carriers.
  """
  alias Auctane.ShipEngineData.Carriers.Contexts.Carriers

  @doc "List all carriers"
  @spec carriers_cli() :: :ok
  def carriers_cli do
    case Carriers.list_carriers() do
      {:ok, carriers} -> output_carriers(carriers)
      {:error, error} -> error |> output_carrier_error() |> IO.puts()
    end
  end

  @doc "Output a list of carriers"
  @spec output_carriers([Carrier.t()]) :: :ok
  def output_carriers(carriers) do
    IO.puts("\nYou have #{Enum.count(carriers)} carrier accounts connected:\n")
    for c <- carriers, do: IO.puts(format_carrier(c))
    IO.puts("")
  end

  @doc """
  Output an error for listing (doctest)

  ## Examples

    iex>output_carrier_error("Test Error")
    "Error retreiving your carrier list: Test Error. Please ensure you are logged in."
  """
  def output_carrier_error(error),
    do:
      "Error retreiving your carrier list: #{error}" <>
        ". Please ensure you are logged in."

  defp format_carrier(carrier), do: "- #{carrier.friendly_name} (#{carrier.carrier_id})"
end
