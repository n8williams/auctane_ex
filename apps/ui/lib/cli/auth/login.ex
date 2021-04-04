defmodule Auctane.Ui.Cli.Auth.Login do
  @moduledoc """
  Handle the interaction with users from the Command Line Interface for
  interacting with inputs for logging the user in.
  """

  # alias Auctane.ShipEngineData.Carriers.Carriers

  # NOTE: I would be somewhat particular about which data would warrant
  # attribute status, versus something like
  #
  #   defp login_prompt, do: "Please enter your ShipEngine API key:"
  #   defp logged_in_message, do:"You have successfully logged in"
  #   defp persistance_prompt,
  #     do: "Do you want to persist your login for future sessions? (Y/N):"
  #
  #  The fact that using attributes made these one-liners won the day.
  #  Preference: comments (with the exception of urls) shuold fit within an 80
  #  character vim-type-width-limit, the code extending to up to the width
  #  allowed by the formatter.
  @login_prompt "Please enter your ShipEngine API key:"
  @logged_in_message "You have successfully logged in"
  @persistance_prompt "Do you want to persist your login for future sessions? (Y/N):"

  @doc "Log the user in"
  @spec login_cli() :: :ok
  def login_cli do
    api_key = IO.gets(@login_prompt)
    persist_login? = IO.gets(@persistance_prompt)
    put_key(api_key)
    IO.puts(@logged_in_message)
  end

  defp put_key(key) do
    path = api_key_file_path()
    File.rm!(path)
    File.write!(path, key)
  end

  # Put this in a auth/support folder in a support module
  defp api_key_file_path, do: Path.expand("../../../priv", __DIR__) <> "/user_api_key.txt"
end
