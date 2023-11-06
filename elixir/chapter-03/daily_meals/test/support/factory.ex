defmodule DailyMeals.Factory do
  use ExMachina.Ecto, repo: DailyMeals.Repo

  def meal_factory do
    kcal = :rand.uniform(1000)
    days = :rand.uniform(10)

    descricao =
      Faker.Lorem.words(10..20)
      |> Enum.join(" ")

    %{
      descricao: descricao,
      data: Faker.Date.backward(days),
      calorias: "#{kcal} kcal"
    }
  end
end
