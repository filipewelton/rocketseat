defmodule DailyMeals.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @creation_fields [:descricao, :data, :calorias]
  @update_fields [:descricao, :calorias]
  @derive {Jason.Encoder, only: [:descricao, :data, :calorias]}

  schema "meals" do
    field :descricao, :string
    field :data, :date
    field :calorias, :string
  end

  def changeset(field_values) do
    %__MODULE__{}
    |> cast(field_values, @creation_fields)
    |> validate_required(@creation_fields)
  end

  def changeset(struct, field_values) do
    struct
    |> cast(field_values, @update_fields)
    |> validate_required(@update_fields)
  end
end
