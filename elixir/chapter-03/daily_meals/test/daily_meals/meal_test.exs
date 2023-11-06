defmodule DailyMeals.MealTest do
  use DailyMeals.DataCase

  alias Ecto.Changeset
  alias DailyMeals.Meal

  describe "changeset/1" do
    test "when all params are valid" do
      params = %{
        descricao: "sometext",
        data: NaiveDateTime.utc_now(),
        calorias: "186 kcal"
      }

      response = Meal.changeset(params)

      assert %Changeset{valid?: true} = response
    end

    test "when there params invalid" do
      params = %{
        descricao: "sometext",
        data: NaiveDateTime.utc_now(),
        calorias: 186
      }

      response = Meal.changeset(params)

      assert %Changeset{valid?: false} = response
    end
  end
end
