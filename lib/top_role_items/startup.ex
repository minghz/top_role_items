defmodule TopRoleItems.Startup do
  def ensure_indexes do
   # Mongo.command(:mongo, %{createIndexes: "users",
   #   indexes: [ %{ key: %{ email: 1 },
   #     name: "email_idx",
   #     unique: true} ] })
  end
end
