defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "when all params are valid, return an order" do
      user = build(:user)

      items = [
        build(:item, description: "Virada paulista"),
        build(:item, description: "Macarrão ao molho sugo"),
        build(:item, description: "Pizza")
      ]

      response = Order.build(user, items)
      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "when there is not items in the order, return error" do
      user = build(:user)
      items = []
      response = Order.build(user, items)
      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
