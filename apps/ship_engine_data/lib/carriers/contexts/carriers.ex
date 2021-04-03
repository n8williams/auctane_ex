defmodule Auctane.ShipEngineData.Carriers.Carriers do
  @moduledoc """

  """

  @api_base_url "https://api.shipengine.com"

  @spec list_carriers() :: any()
  def list_carriers() do
    url = @api_base_url <> "/v1/carriers"

    headers = [
      {"Host", "api.shipengine.com"},
      {"API-Key", "TEST_Xfixcya91ZH4FvGn1y2Eu+3Dt4TfL1KRGeXFKUCFc0g"}
    ]

    with request = Finch.build(:get, url, headers),
         {:ok, result} <- Finch.request(request, AuctaneFinch) do
      IO.inspect(result)
      result
    else
      {:error, err} ->
        IO.inspect(err)
        err
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
  end

  # defp retrieve_all_carriers do
  #   # /v1/carriers
  #   # |> Enum.map(&do_retrieve_package_info/1)
  #   |> Enum.reject(&is_nil/1)
  #   |> Enum.map(&do_make_csv_row/1)
  #   |> CSV.encode()
  #   |> Enum.each(fn row -> IO.write(:stdio, row) end)
  # end

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
