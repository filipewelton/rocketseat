defmodule FlightBooking.Bookings.BookingTest do
  use ExUnit.Case

  alias FlightBooking.Bookings.Booking

  import FlightBooking.Factory

  describe "build/1" do
    test "When all params are valid, returns a booking" do
      booking = build(:booking)
      response = Booking.build(booking)
      expected_response = {:ok, booking}

      assert response == expected_response
    end
  end
end
