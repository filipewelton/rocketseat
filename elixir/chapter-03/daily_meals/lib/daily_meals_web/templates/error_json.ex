defmodule DailyMealsWeb.ErrorJSON do
  import Ecto.Changeset, only: [traverse_errors: 2]

  def render("400.json", %{changeset: changeset}) do
    %{"errors" => parse_errors(changeset)}
  end

  def render("404.json", %{message: message}) do
    %{message: message}
  end

  defp parse_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Regex.replace(~r"%{(\w+)}", msg, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end
