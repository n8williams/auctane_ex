defmodule Mix.Tasks.ShipEngine.Login do
  use Mix.Task

  alias Auctane.Ui.Cli.Auth.Login, as: LoginUi

  @shortdoc """
  Prompt the user to enter their API key. It will then store the key in a file
  to use for subsequent tasks.
  """

  @moduledoc """
  A task that calls to the user interface for logging a user in

  If you want to see all carriers without storing your login info, select "N"
  when prompted about persisting your login for future sessions.

  ## Example

        nwilliams$ mix ship_engine.login

  """

  @doc false
  def run(_args) do
    Mix.Task.run("app.start")
    LoginUi.login_cli()
  end
end
