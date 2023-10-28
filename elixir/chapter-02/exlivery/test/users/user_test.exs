defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, return the user" do
      response =
        User.build(
          "Rua das Palmeiras",
          "Filipe",
          "filipe@elixir.com",
          "123456789",
          25
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when all params are invalid, return an error" do
      response =
        User.build(
          "Rua Maestro Rocha",
          "Filipe",
          "filipe@elixir.com",
          "123455",
          15
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
