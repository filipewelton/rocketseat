defmodule DailyMeals.Meals.GetTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Meal
  alias DailyMeals.Meals.{Create, Get}

  describe "call/1" do
    test "when there is an instance" do
      meal = build(:meal)
      {:ok, %Meal{id: in_id}} = Create.call(meal)
      response = Get.call(in_id)

      assert {:ok, %Meal{}} = response
    end

    test "when there is not an instance" do
      response = Get.call(Faker.UUID.v4())

      assert {:error, 404, "Instance not found"} = response
    end
  end
end
