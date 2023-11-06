defmodule DailyMeals.Meals.CreateTest do
  use DailyMeals.DataCase

  import DailyMeals.Factory

  alias DailyMeals.Meals.Create

  describe "call/1" do
    test "when are params is valid" do
      meal = build(:meal)
      response = Create.call(meal)

      assert {:ok, _meal} = response
    end

    test "when there an invalid params" do
      meal = build(:meal, data: 1)
      response = Create.call(meal)

      assert {:error, 400, _data} = response
    end
  end
end
