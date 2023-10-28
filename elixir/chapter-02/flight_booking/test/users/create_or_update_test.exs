defmodule FlightBooking.Users.CreateOrUpdateTest do
  use ExUnit.Case

  import FlightBooking.Factory

  alias FlightBooking.Users.CreateOrUpdate
  alias FlightBooking.Users.Agent, as: UserAgent

  setup do
    UserAgent.start_link()
    :ok
  end

  describe "call/1" do
    test "When all params are valid, return a tuple" do
      user = build(:user)

      CreateOrUpdate.call(user)

      response = UserAgent.get(user.cpf)
      expected_response = {:ok, user}

      assert response == expected_response
    end
  end
end
