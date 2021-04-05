defmodule Mix.Tasks.ShipEngine.Logout do
  use Mix.Task

  alias Auctane.Ui.Cli.Auth.Logout, as: LogoutUi

  @shortdoc "Log the user out by deleting the locally-stored API key"

  @moduledoc """
  A task that calls to the user interface for logging a user out

  ## Example

      nwilliams$ mix ship_engine.logout

  """

  @doc false
  def run(_args) do
    Mix.Task.run("app.start")
    LogoutUi.logout_cli()
  end
end
