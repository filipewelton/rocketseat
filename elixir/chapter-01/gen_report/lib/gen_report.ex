defmodule GenReport do
  @month_string %{
    1 => "janeiro",
    2 => "fevereiro",
    3 => "março",
    4 => "abril",
    5 => "maio",
    6 => "junho",
    7 => "julho",
    8 => "agosto",
    9 => "setembro",
    10 => "outubro",
    11 => "novembro",
    12 => "dezembro"
  }

  alias GenReport.Parser

  def build() do
    {:error, "Insira o nome de um arquivo"}
  end

  def build(filename) do
    Parser.open_file(filename)
    |> gen_reports()
  end

  def gen_reports(registers) do
    total_hours_worked_report = 
      registers
      |> Enum.reduce(%{}, &get_report_by_total_worked_hours(&1, &2))

    hours_per_month_report =
      registers
      |> Enum.reduce(%{}, &get_report_by_worked_hours_per_month(&1, &2))

    hours_per_year_report =
      registers
      |> Enum.reduce(%{}, &get_report_by_worked_hours_per_year(&1, &2))

    %{
      all_hours: total_hours_worked_report,
      hours_per_month: hours_per_month_report,
      hours_per_year: hours_per_year_report
    }
  end

  defp get_report_by_total_worked_hours(register, report) do
    [name, worked_hours, _d, _m, _year] = register
    current_worked_hours = report[name]

    if current_worked_hours == nil do
      Map.put(report, name, worked_hours)
    else
      updated_worked_hours = report[name] + worked_hours
      Map.replace(report, name, updated_worked_hours)
    end
  end

  defp get_report_by_worked_hours_per_month(register, report) do
    [name, worked_hours, _d, month, _y] = register
    month = @month_string[month]
    source = report[name] || %{}
    report = Map.put_new(report, name, source)
    current_worked_hours = source[month]

    if current_worked_hours == nil do
      source = Map.put(source, month, worked_hours)
      Map.put(report, name, source)
    else
      updated_worked_hours = source[month] + worked_hours
      updated_source = Map.replace(source, month, updated_worked_hours)
      Map.replace(report, name, updated_source)
    end
  end

  defp get_report_by_worked_hours_per_year(register, report) do
    [name, worked_hours, _d, _m, year] = register
    source = report[name] || %{}
    report = Map.put_new(report, name, source)
    current_worked_hours = source[year]

    if current_worked_hours == nil do
      source = Map.put(source, year, worked_hours)
      Map.put(report, name, source)
    else
      updated_worked_hours = source[year] + worked_hours
      updated_source = Map.put(source, year, updated_worked_hours)
      Map.replace(report, name, updated_source)
    end
  end
end
