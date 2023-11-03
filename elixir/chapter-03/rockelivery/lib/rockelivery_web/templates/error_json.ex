defmodule RockeliveryWeb.ErrorJSON do
  import Ecto.Changeset, only: [traverse_errors: 2]

  alias Rockelivery.Error
  alias Ecto.Changeset

  def _render("error.json", %{payload: %Error{} = payload}) do
    %{result: %Changeset{} = result} = payload
    %{message: parse_error(result)}
  end

  def render("error.json") do
    %{message: true}
  end

  def render("404.json", payload), do: %{}

  defp parse_error(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Regex.replace(~r"%{(\w+)}", msg, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end
