defmodule DailyMealsWeb.MealsJSON do
  def render("201.json", params) do
    %{data: data} = params
    data
  end

  def render("200.json", %{data: data}), do: data
end
