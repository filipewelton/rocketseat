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

  describe "build/1" do
    test "When there are registered reservations" do
      {:ok, out_time} = NaiveDateTime.new(~D[2010-01-01], ~T[23:59:59.000])

      BookingAgent.save(build(:booking, complete_date: out_time))
      BookingAgent.save(build(:booking))
      BookingAgent.save(build(:booking))
      BookingAgent.save(build(:booking))

      {:ok, date_from} = NaiveDateTime.new(~D[2015-01-01], ~T[23:59:59.000])
      {:ok, date_to} = NaiveDateTime.new(~D[2025-01-01], ~T[23:59:59.000])

      time_range = %{
        from: date_from,
        to: date_to
      }

      response = Report.build(time_range)
      expected_response = {:ok, "Report generated successfully"}

      assert response == expected_response
    end
  end
end
