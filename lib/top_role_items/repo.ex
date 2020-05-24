defmodule TopRoleItems.Repo do
  use Ecto.Repo,
    otp_app: :top_role_items,
    adapter: Ecto.Adapters.Postgres
end
