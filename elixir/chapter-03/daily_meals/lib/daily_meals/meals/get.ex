defmodule DailyMeals.Meals.Get do
  alias DailyMeals.{Repo, Meal}

  def call(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, 404, "Instance not found"}
      meal -> {:ok, meal}
    end
  end
end
