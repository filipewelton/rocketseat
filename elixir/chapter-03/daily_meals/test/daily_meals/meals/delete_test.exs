defmodule DailyMeals.Meals.DeleteTest do
  use DailyMeals.DataCase

  import DailyMeals.Factory

  alias DailyMeals.Meal
  alias DailyMeals.Meals.{Create, Delete}

  describe "call/1" do
    test "when is deleted successfully" do
      meals = build(:meal)

      {:ok, %Meal{id: id}} = Create.call(meals)

      response = Delete.call(id)
      expected_response = {:ok, "Instance delete successfully"}

      assert response == expected_response
    end

    test "when an instance not found" do
      response = Delete.call(Faker.UUID.v4())
      expected_response = {:error, 404, "Instance not found"}

      assert response == expected_response
    end
  end
end
