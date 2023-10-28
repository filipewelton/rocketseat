defmodule FlightBooking.Users.Agent do
  use Agent

  alias FlightBooking.Users.User

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%User{} = user) do
    Agent.update(__MODULE__, &update_state(&1, user))
    {:ok, user}
  end

  defp update_state(state, %User{} = user) do
    %{cpf: cpf} = user
    Map.put(state, cpf, user)
  end

  def get(cpf) do
    Agent.get(__MODULE__, &handle_recovery(&1, cpf))
  end

  defp handle_recovery(state, cpf) do
    case Map.get(state, cpf) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
