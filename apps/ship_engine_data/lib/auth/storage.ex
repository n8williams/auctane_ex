defmodule Auctane.ShipEngineData.Auth.Storage do
  @moduledoc "Logic for persisting authoization data"

  alias Auctane.ShipEngineData.Auth.Support

  @doc "Clears the contents (api key) in the `user_api_key.txt` file"
  @spec clear_key!() :: :ok
  def clear_key! do
    path = Support.api_key_file_path()
    File.rm!(path)
    File.write!(path, "")
    :ok
  end

  @doc "Retrieves the api key from the `user_api_key.txt` file"
  @spec load_key!() :: :String.t()
  def load_key! do
    case System.get_env("MIX_ENV", "dev") do
      "test" -> System.get_env("TEST_SHIP_ENGINE_API_KEY", "")
      _ -> do_load_key!()
    end
  end

  defp do_load_key! do
    path = Support.api_key_file_path()
    File.read!(path) |> String.trim()
  end

  @doc "Clears and puts the api key to the `user_api_key.txt` file"
  @spec put_key!(String.t()) :: :ok
  def put_key!(key) do
    path = Support.api_key_file_path()
    File.rm!(path)
    File.write!(path, key)
    :ok
  end
end
