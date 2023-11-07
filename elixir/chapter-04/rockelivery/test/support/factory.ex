defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 18,
      address: "Av. Faria Lima",
      cep: "12345678",
      email: "username@domain.com",
      password: "1234567890132464763785",
      name: "Himura",
      cpf: "12345678901"
    }
  end

  def user_factory do
    %User{
      age: 18,
      address: "Av. Faria Lima",
      cep: "12345678",
      email: "username@domain.com",
      password: "1234567890132464763785",
      name: "Himura",
      cpf: "12345678901",
      id: "022cb207-7771-44ab-ac77-e3378b379d65"
    }
  end
end
