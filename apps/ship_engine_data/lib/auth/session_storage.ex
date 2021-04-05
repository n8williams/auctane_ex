defmodule Auctane.ShipEngineData.Auth.SessionStorage do
  @moduledoc "Logic for persisting authorization data for an iex session"
  use Agent

  def start_link(initial_value),
    do: Agent.start_link(fn -> %{api_key: initial_value} end, name: __MODULE__)

  def clear, do: Agent.update(__MODULE__, &Map.put(&1, :api_key, ""))

  def get, do: Agent.get(__MODULE__, &Map.get(&1, :api_key))

  def put(api_key), do: Agent.update(__MODULE__, &Map.put(&1, :api_key, api_key))
end
