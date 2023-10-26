defmodule GenReport.Parser do
  def open_file(filename) do
    path = "assets/#{filename}"

    path
    |> File.stream!()
    |> Enum.map(&parse_file(&1))
  end

  defp parse_file(file_line) do
    file_line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, &String.to_integer/1)
    |> List.update_at(2, &String.to_integer/1)
    |> List.update_at(3, &String.to_integer/1)
  end
end
