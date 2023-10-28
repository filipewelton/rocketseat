defmodule Exlivery.User.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      UserAgent.start_link(%{})

      user = build(:user)
      response = UserAgent.save(user)
      expected_response = :ok

      assert response == expected_response
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "12345678900"

      {:ok, cpf: cpf}
    end

    test "when the user is found, return user", params do
      %{cpf: cpf} = params

      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response =
        {:ok,
         %User{
           cpf: cpf,
           name: "Filipe",
           email: "filipe@elixir.com",
           age: 25,
           address: "Rua das Palmeiras"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("102938475600")
      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
