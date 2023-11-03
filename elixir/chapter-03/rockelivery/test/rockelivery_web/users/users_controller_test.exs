defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, return the user", %{conn: conn} do
      params = %{
        "age" => 20,
        "name" => "John",
        "email" => "john@doe.com",
        "cpf" => "12345678901",
        "address" => "Rua Jardim Europa",
        "cep" => "12345678",
        "password" => "1345678901234127867868768"
      }

      response =
        conn
        |> post("/api/users", params)
        |> json_response(201)

      expected_response = "User created successfully"

      assert response["message"] == expected_response
    end

    test "when there is some error, returns error", %{conn: conn} do
      params = %{
        "name" => "John",
        "email" => "john@doe.com",
        "cpf" => "12345678901",
        "address" => "Rua Jardim Europa",
        "cep" => "12345678",
        "password" => "1345678901234127867868768"
      }

      response =
        conn
        |> post("/api/users", params)
        |> json_response(400)

      expected_response = %{"message" => %{"age" => ["can't be blank"]}}

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, delete the user", %{conn: conn} do
      id = "022cb207-7771-44ab-ac77-e3378b379d65"
      insert(:user)

      response =
        conn
        |> put_req_header("content-type", "application/json")
        |> delete("/api/users", id: id)
        |> response(200)

      expected_response = true

      assert response == expected_response
    end
  end
end
