defmodule RockeliveryWeb.UsersController do
  use RockeliveryWeb, :controller

  alias RockeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(connection, params) do
    with {:ok, user} <- Rockelivery.create_user(params) do
      connection
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def delete(connection, %{"id" => id}) do
    IO.inspect(id)

    connection
    |> put_status(400)
    |> text("")
  end

  def show(connection, %{"id" => id}) do
    with {:ok, user} <- Rockelivery.get_user_by_id(id) do
      connection
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def update(connection, params) do
    with {:ok, user} <- Rockelivery.update_user(params) do
      connection
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end
end
