defmodule Exlivery.Orders.Report do
  alias Exlivery.Orders
  alias Orders.{Order, Item}
  alias Orders.Agent, as: OrderAgent

  def create(filename \\ "report.csv") do
    order_list = build_order_list()

    File.write(filename, order_list)
  end

  defp build_order_list() do
    OrderAgent.get_all()
    |> Map.values()
    |> Enum.map(&order_string(&1))
  end

  defp order_string(%Order{} = order) do
    %{
      user_cpf: cpf,
      items: items,
      total_price: total_price
    } = order

    item_string = Enum.map(items, &item_string(&1))
    "#{cpf},#{item_string},#{total_price}\n"
  end

  defp item_string(%Item{} = item) do
    %{
      category: category,
      quantity: quantity,
      unity_price: unity_price
    } = item

    "#{category},#{quantity},#{unity_price}"
  end
end
