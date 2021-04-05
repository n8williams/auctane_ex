defmodule Auctane.ShipEngineData.Auth.SessionStorage do
  @moduledoc "Logic for persisting authorization data for an iex session"
  use Agent

  @doc false
  def start_link(initial_value),
    do: Agent.start_link(fn -> %{api_key: initial_value} end, name: __MODULE__)

  @doc false
  def clear, do: Agent.update(__MODULE__, &Map.put(&1, :api_key, ""))

  @doc false
  def get, do: Agent.get(__MODULE__, &Map.get(&1, :api_key))

  @doc false
  def put(api_key), do: Agent.update(__MODULE__, &Map.put(&1, :api_key, api_key))
end
