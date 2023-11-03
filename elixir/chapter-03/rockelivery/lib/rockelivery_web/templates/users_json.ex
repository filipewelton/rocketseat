defmodule RockeliveryWeb.UsersJSON do
  alias Rockelivery.User

  def render("create.json", params) do
    %{user: %User{} = user} = params

    %{
      message: "User created successfully",
      user: user
    }
  end

  def render("user.json", %{user: %User{} = user}), do: user
end
