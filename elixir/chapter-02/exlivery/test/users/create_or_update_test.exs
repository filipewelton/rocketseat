defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, save the user" do
      params = %{
        name: "Filipe",
        address: "Rua das Palmeiras",
        age: 25,
        cpf: "12345678900",
        email: "elixir@domain.com"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, return error" do
      params = %{
        name: "Filipe",
        address: "Rua das Palmeiras",
        age: 1,
        cpf: "12345678900",
        email: "elixir@domain.com"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
