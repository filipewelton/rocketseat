defmodule FlightBooking.Bookings.Agent do
  use Agent

  alias FlightBooking.Bookings.Booking

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%Booking{} = booking) do
    %{id: id} = booking
    Agent.update(__MODULE__, &update_state(&1, booking))
    {:ok, id}
  end

  defp update_state(state, %Booking{} = booking) do
    %{id: id} = booking
    Map.put(state, id, booking)
  end

  def get(user_id) do
    Agent.get(__MODULE__, &handle_recovery(&1, user_id))
  end

  defp handle_recovery(state, user_id) do
    booking =
      state
      |> Map.values()
      |> Enum.filter(&get_booking_by_user_id(&1, user_id))

    if booking == [] do
      {:error, "Booking not found"}
    else
      {:ok, List.first(booking)}
    end
  end

  defp get_booking_by_user_id(booking, user_id) do
    %{user_id: uid} = booking

    if user_id == uid do
      true
    else
      false
    end
  end

  def get_all, do: Agent.get(__MODULE__, & &1)
end
