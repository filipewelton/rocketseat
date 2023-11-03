defmodule Rockelivery.Users.Create do
  alias Rockelivery.{Repo, User, Error}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result), do: result

  defp handle_insert({:error, changeset}) do
    Error.build(:bad_request, result: changeset)
  end
end
