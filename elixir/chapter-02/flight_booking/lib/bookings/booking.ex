defmodule FlightBooking.Bookings.Booking do
  @keys [
    :id,
    :complete_date,
    :local_origin,
    :local_destination,
    :user_id
  ]

  @enforce_keys @keys

  defstruct @keys

  def build(%__MODULE__{} = booking) when is_nil(booking.user_id) do
    {:error, "User ID field must not be empty"}
  end

  def build(%__MODULE__{} = booking) do
    {:ok, booking}
  end
end
