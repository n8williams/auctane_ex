defmodule Mix.Tasks.ShipEngine.Login do
  use Mix.Task
  alias Auctane.Ui.Cli.Auth.Login, as: LoginUi

  @shortdoc """
  Prompt the user to enter their API key. It will then store the key in a file
  to use for subsequent tasks.
  """

  @moduledoc """
  Launches the Command Line Login Interface for ...

  ## Example

  mix ship_engine.login
  """

  def run(_args) do
    Mix.Task.run("app.start")
    LoginUi.login_cli()
  end
end
