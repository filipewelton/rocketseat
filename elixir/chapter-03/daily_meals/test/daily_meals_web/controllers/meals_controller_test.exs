defmodule DailyMealsWeb.MealsControllerTest do
  use DailyMealsWeb.ConnCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Meal
  alias DailyMeals.Meals.Create

  describe "create/1" do
    test "when all params are valid", %{conn: conn} do
      params = %{
        descricao: "some text",
        data: NaiveDateTime.utc_now(),
        calorias: "122 kcal"
      }

      [parsed_date | _] =
        params.data
        |> NaiveDateTime.to_string()
        |> String.split(" ")

      response =
        conn
        |> post("/api/meals", params)
        |> json_response(201)

      assert response["descricao"] == params[:descricao]
      assert response["calorias"] == params[:calorias]
      assert response["data"] == parsed_date
    end

    test "when there params invalid", %{conn: conn} do
      params = %{descricao: "some text"}

      response =
        conn
        |> post("/api/meals", params)
        |> json_response(400)

      expected_response = %{
        "errors" => %{"calorias" => ["can't be blank"], "data" => ["can't be blank"]}
      }

      assert response == expected_response
    end
  end

  describe "get/1" do
    test "when an instance is found", %{conn: conn} do
      meal = build(:meal)
      {:ok, %Meal{id: id}} = Create.call(meal)

      response =
        conn
        |> get("/api/meals/#{id}")
        |> json_response(200)

      expected_response = %{
        "descricao" => meal.descricao,
        "data" => to_string(meal.data),
        "calorias" => meal.calorias
      }

      assert response == expected_response
    end

    test "when an instance is not found", %{conn: conn} do
      id = Faker.UUID.v4()

      response =
        conn
        |> get("/api/meals/#{id}")
        |> json_response(404)

      expected_response = %{"message" => "Instance not found"}

      assert response == expected_response
    end
  end

  describe "update/2" do
    test "when an instance is updated", %{conn: conn} do
      meal = build(:meal)

      params = %{
        calorias: "1.257 kcal"
      }

      {:ok, %Meal{id: id}} = Create.call(meal)

      response =
        conn
        |> patch("/api/meals/#{id}", params)
        |> json_response(200)

      expected_response = %{
        "descricao" => meal.descricao,
        "data" => to_string(meal.data),
        "calorias" => params.calorias
      }

      assert response == expected_response
    end
  end

  describe "delete/1" do
    test "when an instance is deleted", %{conn: conn} do
      meal = build(:meal)

      {:ok, %Meal{id: id}} = Create.call(meal)

      response =
        conn
        |> delete("/api/meals/#{id}")
        |> text_response(204)

      assert response == ""
    end
  end
end
