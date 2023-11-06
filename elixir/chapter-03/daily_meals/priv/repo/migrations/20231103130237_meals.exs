defmodule DailyMeals.Repo.Migrations.Meals do
  use Ecto.Migration

  def change do
    create table(:meals, primary_key: false) do
      add :id, :binary_id
      add :descricao, :string
      add :data, :date
      add :calorias, :string
    end
  end
end
