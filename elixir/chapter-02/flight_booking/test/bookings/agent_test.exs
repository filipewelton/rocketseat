defmodule FlightBooking.Bookings.AgentTest do
  use ExUnit.Case

  import FlightBooking.Factory

  alias FlightBooking.Bookings.Agent, as: BookingAgent

  setup do
    BookingAgent.start_link()
    :ok
  end

  describe "save/1" do
    test "When the param are valid, return a booking uuid" do
      booking = build(:booking)
      response = BookingAgent.save(booking)
      booking_id = booking.id
      expected_response = {:ok, booking_id}

      assert response == expected_response
    end
  end

  describe "get/1" do
    test "When the user is found, return a booking" do
      %{id: user_id} = build(:user)
      booking = build(:booking, user_id: user_id)

      BookingAgent.save(booking)

      response = BookingAgent.get(user_id)
      expected_response = {:ok, booking}

      assert response == expected_response
    end

    test "When the user is't founded, returns an error" do
      user_id = Faker.UUID.v4()
      booking = build(:booking)

      BookingAgent.save(booking)

      response = BookingAgent.get(user_id)
      expected_response = {:error, "Booking not found"}

      assert response == expected_response
    end
  end
end
