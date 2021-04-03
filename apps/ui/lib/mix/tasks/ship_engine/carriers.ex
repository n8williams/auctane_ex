defmodule Mix.Tasks.ShipEngine.Carriers do
  use Mix.Task

  @shortdoc """
  Lists all of the carrier accounts that are connected to the user’s ShipEngine
  account.
  """

  @moduledoc """
  This module scrapes license information about the elixir/erlang dependencies for this project.

  ## Example

  mix ship_engine.carriers
  """

  @api_base_url "https://api.shipengine.com"

  def run(_args) do
    # This will start our application.
    # See: https://elixirschool.com/en/lessons/basics/mix-tasks/#loading-your-application
    # The Finch library requires this, "you must start it and provide a :name".
    # SEe: https://hexdocs.pm/finch/Finch.html
    Mix.Task.run("app.start")

    result = :get |> Finch.build("https://hex.pm") |> Finch.request(AuctaneFinch)
    IO.inspect(result)
    IO.puts("Result fetched")
    # retrieve_all_carriers()
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

  defp fetch_description(%{meta_json: %{"description" => description}} = info),
    do: Map.put(info, :description, description)

  defp fetch_description(info), do: Map.put(info, :description, "")

  defp fetch_url(%{json: %{"url" => url}} = info),
    do: Map.put(info, :url, url)
end
