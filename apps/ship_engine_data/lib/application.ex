defmodule Auctane.ShipEngineData.Application do
  @moduledoc false
  # See https://hexdocs.pm/elixir/Application.html for more information on OTP
  # Applications.
  alias Auctane.ShipEngineData.Auth.SessionStorage
  use Application

  def start(_type, _args) do
    children = [
      # See: https://hexdocs.pm/finch/Finch.html: In order to use Finch ...
      {Finch, name: AuctaneFinch},
      {SessionStorage, ""}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Auctane.Cli.Supervisor)
  end
end
