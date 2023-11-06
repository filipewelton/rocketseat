defmodule DailyMeals.Meals.Create do
  alias DailyMeals.{Meal, Repo}

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_response()
  end

  defp handle_response({:ok, data}), do: {:ok, data}

  defp handle_response({:error, data}), do: {:error, 400, data}
end
