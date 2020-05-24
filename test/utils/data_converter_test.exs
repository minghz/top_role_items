defmodule Utils.DataConverterTest do
  use ExUnit.Case

  test 'parses an item' do
    first_item = Utils.DataConverter.fetch_items |> List.first
    assert "Antimatter Rifle" == first_item["name"]
  end

  test 'goes through all items' do
    num_items = Utils.DataConverter.fetch_items |> length
    assert 1319 == num_items
  end

  test 'gets a property' do
    property = Utils.DataConverter.fetch_properties |> List.first
    assert "A" == property["abbreviation"]
  end

  test 'gets all properties' do
    num_properties = Utils.DataConverter.fetch_properties |> length
    assert 13 == num_properties
  end

  test 'gets a type' do
    type = Utils.DataConverter.fetch_types |> List.first
    assert "AT" == type["abbreviation"]
  end

  test 'gets all types' do
    num_types = Utils.DataConverter.fetch_types |> length
    assert 6 == num_types
  end

  test 'get a type extension' do
    ext = Utils.DataConverter.fetch_type_extensions |> List.first
    assert "INS" == ext["appliesTo"]
  end

  test 'get all type extensions' do
    num_ext = Utils.DataConverter.fetch_type_extensions |> length
    assert 2 == num_ext
  end
end
