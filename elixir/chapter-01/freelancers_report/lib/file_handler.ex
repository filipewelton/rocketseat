defmodule FreelancersReport.FileHandler do
  def open(filename) when is_nil(filename), do: {:error, "Filename is required"}

  def open(filename) do
    filename
    |> String.trim()
    |> handle_opening_file()
  end

  defp handle_opening_file(filename) when filename == "" do
    {:error, "Invalid filename"}
  end

  defp handle_opening_file(filename) do
    file =
      File.stream!("assets/#{filename}")
      |> Enum.map(&parse_csv_file(&1))

    {:ok, file}
  end

  defp parse_csv_file(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, &String.to_integer/1)
    |> List.update_at(2, &String.to_integer/1)
    |> List.update_at(3, &String.to_integer/1)
  end
end
