# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TopRoleItems.Repo.insert!(%TopRoleItems.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Mongo.start_link(
  name: :mongo,
  database: "top_role_items_db",
  hostname: "mongo",
  username: "root",
  password: "rootpassword"
)

## Deleting existing data
Mongo.delete_many(:mongo, "items", %{})
|> IO.inspect(label: "Deleting all items")

Mongo.delete_many(:mongo, "properties", %{})
|> IO.inspect(label: "Deleting all properties")

Mongo.delete_many(:mongo, "types", %{})
|> IO.inspect(label: "Deleting all types")

Mongo.delete_many(:mongo, "type_extensions", %{})
|> IO.inspect(label: "Deleting all type extensions")


## Populating data
data = Utils.DataConverter.fetch_items
{:ok, _} = Mongo.insert_many(:mongo, "items", data)
Mongo.count(:mongo, "items", %{})
|> IO.inspect(label: "Number of inserted items")

data = Utils.DataConverter.fetch_properties
{:ok, _} = Mongo.insert_many(:mongo, "properties", data)
Mongo.count(:mongo, "properties", %{})
|> IO.inspect(label: "Number of inserted properties")

data = Utils.DataConverter.fetch_types
{:ok, _} = Mongo.insert_many(:mongo, "types", data)
Mongo.count(:mongo, "types", %{})
|> IO.inspect(label: "Number of inserted types")

data = Utils.DataConverter.fetch_type_extensions
{:ok, _} = Mongo.insert_many(:mongo, "type_extensions", data)
Mongo.count(:mongo, "type_extensions", %{})
|> IO.inspect(label: "Number of inserted type extensions")
