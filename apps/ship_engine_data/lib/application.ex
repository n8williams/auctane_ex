defmodule Auctane.ShipEngineData.Application do
  @moduledoc """
  The application module for the ShipEngine Data app

  This module is crucial for ensuring the HTTP Client, Finch, is setup properly
  using a Supervision tree, and also enables us to track the state of a user's
  login session with the SessionStorage `Agent`.
  """

  # See https://hexdocs.pm/elixir/Application.html for more information on OTP
  # Applications.

  alias Auctane.ShipEngineData.Auth.SessionStorage
  use Application

  def start(_type, _args) do
    children = [
      # See: https://hexdocs.pm/finch/Finch.html: "In order to use Finch ...""
      {Finch, name: AuctaneFinch},
      {SessionStorage, ""}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Auctane.Cli.Supervisor)
  end
end
