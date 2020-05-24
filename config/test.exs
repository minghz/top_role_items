use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :top_role_items, TopRoleItemsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :top_role_items, TopRoleItems.Repo,
  username: "postgres",
  password: "postgres",
  database: "top_role_items_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
