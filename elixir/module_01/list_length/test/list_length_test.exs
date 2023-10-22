defmodule ListLengthTest do
  use ExUnit.Case

  describe "call/1" do
    test "count list elements" do
      list_1 = [1, 2, 3, 4, 5, 6]
      list_2 = [1, 2]
      list_3 = [1, 2, 3, 4]

      assert ListLength.call(list_1) == 6
      assert ListLength.call(list_2) == 2
      assert ListLength.call(list_3) == 4
    end

    test "passing an empty list" do
      list = []

      assert ListLength.call(list) == 0
    end
  end
end
