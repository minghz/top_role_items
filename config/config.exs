# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :top_role_items,
  ecto_repos: [TopRoleItems.Repo]

# Configures the endpoint
config :top_role_items, TopRoleItemsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dM0SP4T1J39qUKOKfqtxEk+P7KhqY9yhsn8x1RMDNyjTINAETjUH8otWjnDViQui",
  render_errors: [view: TopRoleItemsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TopRoleItems.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
