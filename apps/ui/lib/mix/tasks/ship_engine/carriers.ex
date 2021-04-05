defmodule Mix.Tasks.ShipEngine.Carriers do
  use Mix.Task

  alias Auctane.Ui.Cli.Carriers.Carriers, as: CarriersUi

  @shortdoc """
  Lists all of the carrier accounts that are connected to the user’s ShipEngine
  account.
  """

  @moduledoc """
  A task that outputs a user's carriers

  This task assumes you have previously logged in.

  ## Example

      nwilliams$ mix ship_engine.carriers

  """

  @doc false
  def run(_args) do
    # This will start our application.
    # See: https://elixirschool.com/en/lessons/basics/mix-tasks/#loading-your-application
    # The Finch library requires this, "you must start it and provide a :name".
    # See: https://hexdocs.pm/finch/Finch.html
    Mix.Task.run("app.start")

    CarriersUi.carriers_cli()
  end
end
