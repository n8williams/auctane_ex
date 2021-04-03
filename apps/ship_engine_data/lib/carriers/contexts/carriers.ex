defmodule Auctane.ShipEngineData.Carriers.Carriers do
  @moduledoc false

  alias Auctane.ShipEngineData.Carriers.Carrier

  @api_base_url "https://api.shipengine.com"

  @doc """
  Retrieves the carriers from the shipengine API

  This parses the responses and returns a list of structs in an :ok tuple, or
  formats any errors and returns an :error tuple.
  """
  @spec list_carriers() :: [Carrier.t()]
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

    # {:ok, stub()}

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
  end

  defp reduce_data_string_keys_to_atoms(atom_key, acc, carrier_data) do
    string_field = Atom.to_string(atom_key)
    string_field_value = Map.get(carrier_data, string_field)
    Map.put(acc, atom_key, string_field_value)
  end

  # See also https://stackoverflow.com/questions/30927635/in-elixir-how-do-you-initialize-a-struct-with-a-map-variable
  defp to_atom_keys(data) do
    Carrier.__struct__()
    |> Map.drop([:__struct__])
    |> Map.keys()
    |> Enum.reduce(%{}, &reduce_data_string_keys_to_atoms(&1, &2, data))
  end

  defp to_carrier_struct(data) do
    struct(Carrier, to_atom_keys(data))
  end

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
end
