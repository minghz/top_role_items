defmodule TopRoleItems.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      TopRoleItemsWeb.Endpoint,
      worker(Mongo, [[name: :mongo, database: "top_role_items_dev"]])
    ]

    opts = [strategy: :one_for_one, name: TopRoleItems.Supervisor]
    result = Supervisor.start_link(children, opts)

    TopRoleItems.Startup.ensure_indexes

    result
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TopRoleItemsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
