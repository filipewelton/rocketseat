defmodule DailyMealsWeb.FallBackController do
  use DailyMealsWeb, :controller

  alias DailyMealsWeb.ErrorJSON

  def call(connection, {:error, status, message}) when status == 404 do
    connection
    |> put_status(status)
    |> put_view(ErrorJSON)
    |> render("404.json", message: message)
  end

  def call(connection, {:error, status, changeset}) when status == 400 do
    connection
    |> put_status(status)
    |> put_view(ErrorJSON)
    |> render("400.json", changeset: changeset)
  end
end
