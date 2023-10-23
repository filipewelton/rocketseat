defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  @available_foods [
    "açaí",
    "churrasco",
    "esfirra",
    "hambúrguer",
    "pastel",
    "pizza",
    "prato_feito",
    "sushi"
  ]

  @options ["foods", "users"]

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  def build_from_many(filenames) when length(filenames) == 0 do
    {:error, "No file list was provided"}
  end

  def build_from_many(filenames) do
    results =
      filenames
      |> Task.async_stream(&build/1)
      |> Enum.reduce(report_acc(), &merge_reports(&1, &2))

    {:ok, results}
  end

  defp merge_reports(result, report) do
    {:ok, result_map} = result
    %{"foods" => foods_1, "users" => users_1} = result_map
    %{"foods" => foods_2, "users" => users_2} = report

    foods = merge_maps(foods_1, foods_2)
    users = merge_maps(users_1, users_2)
    build_report(foods, users)
  end

  defp merge_maps(map_1, map_2) do
    Map.merge(map_1, map_2, fn _key, value1, value2 -> value1 + value2 end)
  end

  defp sum_values([id, food, price], %{"users" => users, "foods" => foods} = _report) do
    users = Map.put(users, id, users[id] + price)
    foods = Map.put(foods, food, foods[food] + 1)
    build_report(foods, users)
  end

  defp report_acc do
    foods = Enum.into(@available_foods, %{}, &{&1, 0})
    users = Enum.into(1..30, %{}, &{"#{&1}", 0})
    build_report(foods, users)
  end

  def fetch_higher_cost(report, option) when option in @options do
    higher_cost = Enum.max_by(report[option], fn {_key, value} -> value end)
    {:ok, higher_cost}
  end

  def fetch_higher_cost(_report, _options), do: {:error, "Invalid option"}

  defp build_report(foods, users), do: %{"foods" => foods, "users" => users}
end
