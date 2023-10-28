defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Order, Item}

  def user_factory do
    %User{
      name: "Filipe",
      email: "filipe@elixir.com",
      cpf: "123456789",
      age: 25,
      address: "Rua das Palmeiras"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de peperoni",
      category: :pizza,
      unity_price: Decimal.new("49.9"),
      quantity: 1
    }
  end

  def order_factory do
    %Order{
      user_cpf: "123456789",
      delivery_address: "Rua das Palmeiras",
      items: [
        build(:item,
          description: "Virada paulista",
          category: :pizza,
          unity_price: Decimal.new("49.9"),
          quantity: 1
        ),
        build(:item,
          description: "Macarrão ao molho sugo",
          category: :pizza,
          unity_price: Decimal.new("49.9"),
          quantity: 1
        ),
        build(:item,
          description: "Pizza",
          category: :pizza,
          unity_price: Decimal.new("49.9"),
          quantity: 1
        )
      ],
      total_price: Decimal.new("149.70")
    }
  end
end
