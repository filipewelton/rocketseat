defmodule FlightBooking.Users.CreateOrUpdate do
  alias FlightBooking.Users.User
  alias FlightBooking.Users.Agent, as: UserAgent

  def call(%User{} = user) do
    User.build(user)
    |> save_user()
  end

  defp save_user({:ok, user}) do
    UserAgent.save(user)
    {:ok, "User created successfully"}
  end

  defp save_user({:error, _reason} = error), do: error
end
