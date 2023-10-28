defmodule FlightBooking.Users.AgentTest do
  use ExUnit.Case

  import FlightBooking.Factory

  alias FlightBooking.Users.Agent, as: UserAgent

  setup do
    UserAgent.start_link()
    :ok
  end

  describe "save/1" do
    test "When the user is saves, returns an tuple" do
      user = build(:user)
      response = UserAgent.save(user)
      expected_response = {:ok, user}

      assert response == expected_response
    end
  end

  describe "get/1" do
    test "When the user is found, returns the user" do
      user = build(:user)

      UserAgent.save(user)

      response = UserAgent.get(user.cpf)
      expected_response = {:ok, user}

      assert response == expected_response
    end

    test "When the user is't founded, returns an error" do
      id = Faker.UUID.v4()

      response = UserAgent.get(id)
      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
