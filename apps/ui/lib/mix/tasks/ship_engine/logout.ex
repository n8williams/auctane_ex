defmodule Mix.Tasks.ShipEngine.Logout do
  @moduledoc false

  use Mix.Task

  alias Auctane.Ui.Cli.Auth.Logout, as: LogoutUi

  @shortdoc "Log the user out by deleting the locally-stored API key"

  @doc """
  Launches the Command Line Logout Interface for ...

  ## Example

  mix ship_engine.logout
  """

  def run(_args) do
    Mix.Task.run("app.start")
    LogoutUi.logout_cli()
  end
end
