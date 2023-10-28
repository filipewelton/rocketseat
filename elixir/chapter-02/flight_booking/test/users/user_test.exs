defmodule FlightBooking.Users.UserTest do
  use ExUnit.Case

  import FlightBooking.Factory

  alias FlightBooking.Users.User

  describe "build/1" do
    test "When all params are valid, returns the user" do
      user = build(:user)
      response = User.build(user)
      expected_response = {:ok, user}

      assert response == expected_response
    end

    test "When cpf is a integer" do
      user = build(:user, cpf: 10)
      response = User.build(user)
      expected_response = {:error, "CPF field must be a string"}

      assert response == expected_response
    end
  end
end
