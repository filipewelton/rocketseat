defmodule Rockelivery.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:user, primary_key: false) do
      add :id, :binary_id
      add :age, :integer
      add :address, :string
      add :cep, :string
      add :cpf, :string
      add :email, :string
      add :password_hash, :string
      add :name, :string

      timestamps()
    end

    create(unique_index(:user, [:cpf]))
    create(unique_index(:user, [:email]))
  end
end
