defmodule DailyMeals do
  alias DailyMeals.Meals
  alias Meals.{Create, Get, Update, Delete}

  defdelegate create_meal(params), to: Create, as: :call
  defdelegate get_meal(id), to: Get, as: :call
  defdelegate update_meal(params), to: Update, as: :call
  defdelegate delete_meal(id), to: Delete, as: :call
end
