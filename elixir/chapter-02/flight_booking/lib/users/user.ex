defmodule FlightBooking.Users.User do
  @keys [:id, :name, :email, :cpf]

  @enforce_keys @keys

  defstruct @keys

  def build(%__MODULE__{} = user) when not is_bitstring(user.cpf) do
    {:error, "CPF field must be a string"}
  end

  def build(%__MODULE__{} = user) do
    %{
      id: id,
      name: name,
      email: email,
      cpf: cpf
    } = user

    {:ok,
     %__MODULE__{
       id: id,
       name: name,
       email: email,
       cpf: cpf
     }}
  end
end
