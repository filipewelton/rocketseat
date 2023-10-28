defmodule Exlivery.Item.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all param are valid, returns an item" do
      response =
        Item.build(
          "Pizza de peperoni",
          :pizza,
          49.90,
          1
        )

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, return error" do
      response =
        Item.build(
          "Pizza de peperoni",
          :vegan,
          49.90,
          1
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there is an invalid price, return an erro" do
      response =
        Item.build(
          "Pizza de peperoni",
          :pizza,
          "nil",
          1
        )

      expected_response = {:error, "Invalid price"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, return an erro" do
    end
  end
end
