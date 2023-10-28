defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      cpf = "12345678900"
      user = build(:user, cpf: cpf)

      Exlivery.start_agents()
      UserAgent.save(user)

      item1 = %{
        category: :pizza,
        description: "Pizza peperoni",
        quantity: 1,
        unity_price: 49.9
      }

      item2 = %{
        category: :pizza,
        description: "Pizza 4 queijos",
        quantity: 1,
        unity_price: 59.9
      }

      {:ok, user_cpf: cpf, item1: item1, item2: item2}
    end

    test "when all params are valid", params do
      %{
        user_cpf: user_cpf,
        item1: item1,
        item2: item2
      } = params

      order_params = %{user_cpf: user_cpf, items: [item1, item2]}
      response = CreateOrUpdate.call(order_params)

      assert {:ok, _uuid} = response
    end

    test "when \"CPF\" is not found", params do
      %{
        item1: item1,
        item2: item2
      } = params

      order_params = %{user_cpf: "00000000", items: [item1, item2]}
      response = CreateOrUpdate.call(order_params)

      assert {:error, "User not found"} = response
    end

    test "when items contain an invalid item", params do
      %{
        user_cpf: user_cpf,
        item1: item1,
        item2: item2
      } = params

      item1 = %{item1 | quantity: 0}

      order_params = %{user_cpf: user_cpf, items: [item1, item2]}
      response = CreateOrUpdate.call(order_params)

      assert {:error, "Invalid items"} = response
    end

    test "when items is empty", params do
      %{
        user_cpf: user_cpf
      } = params

      order_params = %{user_cpf: user_cpf, items: []}
      response = CreateOrUpdate.call(order_params)
      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
