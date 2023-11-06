defmodule DailyMeals.Meals.UpdateTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias Ecto.Changeset
  alias DailyMeals.{Repo, Meal}
  alias DailyMeals.Meals.Update

  describe "call/2" do
    test "when params are valid" do
      meal = build(:meal)

      {:ok, %Meal{id: id}} =
        meal
        |> Meal.changeset()
        |> Repo.insert()

      params = %{
        "id" => id,
        "descricao" => "Pizza Quatro Queijos"
      }

      response = Update.call(params)

      assert {:ok, %Meal{descricao: "Pizza Quatro Queijos"}} = response
    end

    test "when there are invalid params" do
      meal = build(:meal)

      {:ok, %Meal{id: id}} =
        meal
        |> Meal.changeset()
        |> Repo.insert()

      params = %{
        "id" => id,
        "descricao" => "Pizza Quatro Queijos",
        "calorias" => 195
      }

      response = Update.call(params)

      assert {
               :error,
               400,
               %Changeset{valid?: false}
             } = response
    end

    test "when \"Meal\" instance is not found" do
      id = Faker.UUID.v4()

      params = %{
        "id" => id,
        "calorias" => "1.200 kcal"
      }

      response = Update.call(params)

      assert {:error, 404, "Instance not found"} = response
    end
  end
end
