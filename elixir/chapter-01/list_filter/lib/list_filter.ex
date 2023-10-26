defmodule ListFilter do
  def call(list) do
    odd_numbers =
      Enum.filter(list, fn value ->
        number = Integer.parse(value)
        is_odd_number(number)
      end)

    array_length = length(odd_numbers)

    if array_length == [] do
      0
    else
      array_length
    end
  end

  defp is_odd_number(:error), do: false

  defp is_odd_number({number, _quote}) do
    is_odd = rem(number, 2)

    if is_odd == 0 do
      false
    else
      true
    end
  end
end
