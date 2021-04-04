defmodule Auctane.ShipEngineData.Carriers.Services.CarrierService do
  @moduledoc false

  import Auctane.ShipEngineData.Core.Support.StructSupport, only: [to_atom_keys: 2]

  @api_base_url "https://api.shipengine.com"

  @doc """
  Retrieves the carriers from the shipengine API

  This parses the responses and returns a list of structs in an :ok tuple, or
  formats any errors and returns an :error tuple.
  """
  @spec list_carriers() :: {:ok, [Carrier.t()]} | {:error, any()}
  def list_carriers do
    url = @api_base_url <> "/v1/carriers"

    headers = [
      {"Host", "api.shipengine.com"},
      {"API-Key", "TEST_Xfixcya91ZH4FvGn1y2Eu+3Dt4TfL1KRGeXFKUCFc0g"}
    ]

    with request <- Finch.build(:get, url, headers),
         {:ok, result} <- Finch.request(request, AuctaneFinch),
         {:ok, body} <- Jason.decode(result.body),
         carriers <- Map.get(body, "carriers"),
         carriers <- Enum.map(carriers, &to_carrier_struct/1) do
      {:ok, carriers}
    else
      {:error, err} ->
        err
    end
  end

  @doc false
  def list_carriers_stub, do: {:ok, stub()}

  defp to_carrier_struct(data) do
    # NOTE: As opposed to using an alias `StructSupport.to_atom_keys(data)`,
    # we'll import the function for use here. In practice the explicit alias
    # might be favored here, to indicate where this function is coming from.
    # If the code needs to be more succinct, an imported function might make
    # more sense, but I have not yet determined best practice on when to use
    # `alias` versus `import`, or when to just `use` a module if the caller is
    # using a ton of imported functions, or importing the module without
    # specifying the `only` option.
    struct(Carrier, to_atom_keys(Carrier, data))
  end

  # Bad url with no slash prepending: {:error, %Mint.TransportError{reason: :nxdomain}}
  #    {:ok,
  # %Finch.Response{
  #   body: "{\n    \"request_id\": \"7da7bb81-24b8-4d52-a577-de464bb10790\",\n    \"errors\": [\n        {\n            \"error_source\": \"shipengine\",\n            \"error_type\": \"security\",\n            \"error_code\": \"unauthorized\",\n            \"message\": \"An API key is required. Please see https://www.shipengine.com/docs/auth\"\n        }\n    ]\n}",
  #   headers: [
  #     {"date", "Sat, 03 Apr 2021 17:31:13 GMT"},
  #     {"content-type", "application/json"},
  #     {"transfer-encoding", "chunked"},
  #     {"connection", "keep-alive"},
  #     {"x-shipengine-requestid", "7da7bb81-24b8-4d52-a577-de464bb10790"},
  #     {"vary", "Origin"},
  #     {"access-control-allow-origin", "https://www.shipengine.com"}
  #   ],
  #   status: 401
  # }}

  # defp do_retrieve_all_carriers(%{done?: true} = info), do: info
  #
  # defp do_retrieve_all_carriers(%{name: name} = info) do
  #   @registry_url
  #   |> Kernel.<>(to_string(name))
  #   |> HTTPoison.get()
  #   |> case do
  #     {:ok, response} ->
  #       json = Jason.decode!(response.body)
  #
  #       with %{ok?: true} = info <- init_info(info, json),
  #            %{ok?: true} = info <- fetch_description(info) do
  #         info
  #       else
  #         %{ok?: false, error: error} ->
  #           IO.warn(error)
  #           nil
  #       end
  #
  #     {:error, error} ->
  #       IO.warn(error)
  #       nil
  #   end
  # end

  # defp init_info(info, json) do
  #   %{
  #     ok?: true,
  #     json: json
  #   }
  #   |> Map.merge(info)
  # end

  defp stub do
    [
      %Auctane.ShipEngineData.Carriers.Carrier{
        account_number: "test_account_578982",
        balance: 8507.28,
        carrier_code: "stamps_com",
        carrier_id: "se-578982",
        friendly_name: "Stamps.com",
        nickname: "ShipEngine Test Account - Stamps.com",
        requires_funded_amount: true
      },
      %Auctane.ShipEngineData.Carriers.Carrier{
        account_number: "test_account_578983",
        balance: 0.0,
        carrier_code: "ups",
        carrier_id: "se-578983",
        friendly_name: "UPS",
        nickname: "ShipEngine Test Account - UPS",
        requires_funded_amount: false
      },
      %Auctane.ShipEngineData.Carriers.Carrier{
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
