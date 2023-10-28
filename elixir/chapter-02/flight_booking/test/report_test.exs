defmodule FlightBooking.ReportTest do
  use ExUnit.Case

  import FlightBooking.Factory

  alias FlightBooking.Bookings.Agent, as: BookingAgent
  alias FlightBooking.Users.Agent, as: UserAgent
  alias FlightBooking.Report

  setup do
    BookingAgent.start_link()
    UserAgent.start_link()
    :ok
  end

  describe "build/0" do
    test "When there are registered reservations" do
      BookingAgent.save(build(:booking))
      BookingAgent.save(build(:booking))
      BookingAgent.save(build(:booking))
      BookingAgent.save(build(:booking))

      response = Report.build()
      expected_response = {:ok, "Report generated with success"}

      assert response == expected_response
    end
  end
end
