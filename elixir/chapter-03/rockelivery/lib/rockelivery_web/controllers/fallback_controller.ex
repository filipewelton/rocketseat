defmodule RockeliveryWeb.FallbackController do
  use RockeliveryWeb, :controller

  alias RockeliveryWeb.ErrorJSON
  alias Rockelivery.Error

  def call(connection, %Error{} = error) do
    connection
    |> put_status(error.status)
    |> put_view(ErrorJSON)
    |> render("error.json", payload: error)
  end
end
