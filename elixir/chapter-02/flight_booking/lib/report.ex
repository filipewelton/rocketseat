defmodule FlightBooking.Report do
  alias FlightBooking.Bookings.Agent, as: BookingAgent

  def build() do
    BookingAgent.get_all()
    |> Map.to_list()
    |> Enum.map(&parse_booking_to_string(&1))
    |> write_file()
  end

  defp parse_booking_to_string(booking) do
    {id, data} = booking

    %{
      complete_date: complete_date,
      local_origin: local_origin,
      local_destination: local_destination,
      user_id: user_id
    } = data

    lo_address = Enum.join(local_origin, "|")
    ld_address = Enum.join(local_destination, "|")

    "#{id},#{complete_date},#{lo_address},#{ld_address},#{user_id}\n"
  end

  defp write_file(content) when content == [] do
    {:error, "No bookings was found"}
  end

  defp write_file(content) do
    path = "assets/report.csv"
    File.write!(path, content)
    {:ok, "Report generated with success"}
  end
end
