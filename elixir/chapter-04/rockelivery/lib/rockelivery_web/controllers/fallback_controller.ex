defmodule RockeliveryWeb.FallbackController do
  use RockeliveryWeb, :controller

  alias RockeliveryWeb.ErrorJSON
  alias Rockelivery.Error

  def call(connection, {:error, %Error{} = error}) do
    connection
    |> put_status(error.status)
    |> put_view(ErrorJSON)
    |> render("error.json", errors: error.result)
  end
end
