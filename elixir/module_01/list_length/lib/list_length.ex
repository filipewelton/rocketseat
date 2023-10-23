defmodule ListLength do
  def call([]), do: 0
  def call(list), do: length(list)
end
