defmodule Auctane.Cli.Application do
  @moduledoc false
  # See https://hexdocs.pm/elixir/Application.html for more information on OTP
  # Applications.
  alias Rivendell.Data.{}
  # ASupervisor,
  # ATask
  use Application

  def start(_type, _args) do
    children = [
      # See: https://hexdocs.pm/finch/Finch.html: In order to use Finch ...
      {Finch, name: AuctaneFinch}
      # App.Data.Repo, A repo could go here
      # ASupervisor.child_spec(),
      # ATask,
      # A PubSub, like Phoenix PubSub (possibly from another app) could go here.
      # {Phoenix.PubSub, name: Rivendell.PubSub}
    ]

    # See: https://hexdocs.pm/elixir/Application.html#content
    # See: https://hexdocs.pm/elixir/Supervisor.html#content
    # TODO:NW Write a GenServer for storing credentials, link a good resource.
    # See: https://hexdocs.pm/elixir/Supervisor.html#module-strategies
    Supervisor.start_link(children, strategy: :one_for_one, name: Auctane.Cli.Supervisor)
  end
end
