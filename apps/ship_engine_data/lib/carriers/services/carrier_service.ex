defmodule Auctane.ShipEngineData.Carriers.Services.CarrierService do
  @moduledoc "A service for retrieving carrier data from the remote API"

  import Auctane.ShipEngineData.Core.Support.StructSupport, only: [to_atom_keys: 2]

  alias Auctane.ShipEngineData.Auth.Storage, as: AuthStorage
  alias Auctane.ShipEngineData.Carriers.Schema.Carrier

  @api_base_url "https://api.shipengine.com"

  @doc """
  Retrieves the carriers from the ShipEngine API

  This parses the responses and returns a list of structs in an :ok tuple, or
  formats any errors and returns an :error tuple.
  """
  @spec list_carriers() :: {:ok, [Carrier.t()]} | {:error, any()}
  def list_carriers do
    url = @api_base_url <> "/v1/carriers"

    headers = [
      {"Host", "api.shipengine.com"},
      {"API-Key", AuthStorage.load_key!()}
    ]

    with request <- Finch.build(:get, url, headers),
         {:ok, response} <- Finch.request(request, AuctaneFinch),
         {:ok, carriers} <- parse_reponse(response) do
      {:ok, carriers}
    else
      # Enfore the alternative as an :error tuple that would otherwise trigger a
      # match error.
      {:error, _err} = result -> result
    end
  end

  @doc false
  def list_carriers_stub, do: {:ok, stub()}

  defp parse_reponse(response) do
    case Map.get(response, :status) do
      200 ->
        {:ok, body} = Jason.decode(response.body)

        carriers =
          body
          |> Map.get("carriers")
          |> Enum.map(&to_carrier_struct/1)

        {:ok, carriers}

      code ->
        {:error, "There was an error connecting to the API with response code #{code}"}
    end
  end

  defp to_carrier_struct(data) do
    # NOTE: As opposed to using an alias `StructSupport.to_atom_keys(data)`,
    # we'll import the function for use here. In practice the explicit alias
    # might be favored here, to indicate where this function is coming from.
    # If the code needs to be more succinct, an imported function might make
    # more sense, but I have not yet determined best practice on when to use
    # `alias` versus `import`, or when to just `use` a module if the caller is
    # using a ton of imported functions, or importing the module without
    # specifying the `only` option.
    struct(Carrier, to_atom_keys(%Carrier{}, data))
  end

  # Bad url with no slash prepending: {:error, %Mint.TransportError{reason: :nxdomain}}
  defp stub do
    [
      %Carrier{
        account_number: "test_account_578982",
        balance: 8507.28,
        carrier_code: "stamps_com",
        carrier_id: "se-578982",
        friendly_name: "Stamps.com",
        nickname: "ShipEngine Test Account - Stamps.com",
        requires_funded_amount: true
      },
      %Carrier{
        account_number: "test_account_578983",
        balance: 0.0,
        carrier_code: "ups",
        carrier_id: "se-578983",
        friendly_name: "UPS",
        nickname: "ShipEngine Test Account - UPS",
        requires_funded_amount: false
      },
      %Carrier{
        account_number: "test_account_578984",
        balance: 0.0,
        carrier_code: "fedex",
        carrier_id: "se-578984",
        friendly_name: "FedEx",
        nickname: "ShipEngine Test Account - FedEx",
        requires_funded_amount: false
      }
    ]
  end
end
