defmodule FlightBooking.Bookings.CreateOrUpdate do
  alias FlightBooking.Bookings.Booking
  alias FlightBooking.Bookings.Agent, as: BookingAgent

  def call(%Booking{} = booking) do
    Booking.build(booking)
    |> save_booking()
  end

  defp save_booking({:error, _reason} = error), do: error

  defp save_booking({:ok, booking}) do
    BookingAgent.save(booking)
    {:ok, "Booking was created successfully"}
  end
end
