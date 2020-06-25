defmodule Utils.DataConverter do
  require Logger

  # Lightly massage raw 5eTools data into more digestible data
  # This should probably be invoked from the seeder

  # Want to:
  # 1. Read existing JSON files
  # 2. Consolidate JSON data into one large Dict / Map
  # 3. Return array of consolidated Dict / Map

  # The seeding script that invokes this module would be responsible for
  # inserting the document entries into the DB

  @data_dir "#{File.cwd!}/priv/repo/data/5eTools"

  def fetch_items() do
    base_items = read_items("#{@data_dir}/items-base.json", "baseitem")
    items = read_items("#{@data_dir}/items.json", "item")
    grouped_items = read_items("#{@data_dir}/items.json", "itemGroup")
    
    base_items ++ items ++ grouped_items
  end

  def fetch_properties() do
    read_items("#{@data_dir}/items-base.json", "itemProperty")
  end

  def fetch_types() do
    read_items("#{@data_dir}/items-base.json", "itemType")
  end

  def fetch_type_extensions() do
    read_items("#{@data_dir}/items-base.json", "itemTypeAdditionalEntries")
  end

  defp read_items(file_path, root_key) do
    case File.read(file_path) do
      {:ok, content} -> Jason.decode!(content) |> Map.get(root_key)
      {:error, _} -> Logger.error("Could not read file #{file_path}")
    end
  end
end
