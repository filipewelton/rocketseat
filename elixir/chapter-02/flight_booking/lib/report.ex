defmodule FlightBooking.Report do
  alias FlightBooking.Bookings.Agent, as: BookingAgent

  def build(time_range) when is_nil(time_range) do
    {:error, "Time range is required"}
  end

  def build(time_range) do
    BookingAgent.get_all()
    |> Map.to_list()
    |> Enum.filter(&filter_booking_by_time_range(&1, time_range))
    |> Enum.map(&parse_booking_to_string(&1))
    |> write_file()
  end

  defp filter_booking_by_time_range(booking, time_range) do
    {_id, data} = booking
    %{complete_date: complete_date} = data

    %{
      from: from,
      to: to
    } = time_range

    date_from = NaiveDateTime.compare(complete_date, from)
    date_to = NaiveDateTime.compare(complete_date, to)

    with true <- is_valid_date(:from, date_from),
         true <- is_valid_date(:to, date_to) do
      true
    else
      _ -> false
    end
  end

  defp is_valid_date(:from, date) when date == :lt, do: false

  defp is_valid_date(:from, _date), do: true

  defp is_valid_date(:to, date) when date == :gt, do: false

  defp is_valid_date(:to, _date), do: true

  defp parse_booking_to_string(booking) do
    {id, data} = booking

    %{
      complete_date: complete_date,
      local_origin: local_origin,
      local_destination: local_destination,
      user_id: user_id
    } = data

    "#{id},#{complete_date},#{local_origin},#{local_destination},#{user_id}\n"
  end

  defp write_file(content) when content == [] do
    {:error, "No bookings was found"}
  end

  defp write_file(content) do
    path = "assets/report.csv"
    File.write!(path, content)
    {:ok, "Report generated successfully"}
  end
end
