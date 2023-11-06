defmodule DailyMeals.Meals.Update do
  alias DailyMeals.{Repo, Meal}

  def call(params) do
    %{"id" => id} = params

    case Repo.get(Meal, id) do
      nil -> {:error, 404, "Instance not found"}
      meal -> handle_update(meal, params)
    end
  end

  defp handle_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
    |> handle_response()
  end

  defp handle_response({:ok, _data} = params), do: params

  defp handle_response({:error, data}), do: {:error, 400, data}
end
