defmodule FlightBooking.Bookings.CreateOrUpdateTest do
  use ExUnit.Case

  import FlightBooking.Factory

  alias FlightBooking.Bookings.Agent, as: BookingAgent
  alias FlightBooking.Bookings.CreateOrUpdate

  setup do
    BookingAgent.start_link()
    :ok
  end

  describe "call/1" do
    test "When all params are valid, returns a valid tuple" do
      %{id: user_id} = build(:user)
      booking = build(:booking, user_id: user_id)

      CreateOrUpdate.call(booking)

      response = BookingAgent.get(user_id)
      expected_response = {:ok, booking}

      assert response == expected_response
    end

    test "When there are invalid parameters" do
      user_id = nil
      booking = build(:booking, user_id: user_id)
      response = CreateOrUpdate.call(booking)
      expected_response = {:error, "User ID field must not be empty"}

      assert response == expected_response
    end
  end
end
