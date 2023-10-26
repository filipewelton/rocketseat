defmodule SumListTest do
  use ExUnit.Case

  describe "call/1" do
    test "should return 6" do
      list = [1, 2, 3]
      expected_response = 6
      response = SumList.call(list)

      assert expected_response == response
    end

    test "should return 0" do
      list = []
      expected_response = 0
      response = SumList.call(list)

      assert expected_response == response
    end
  end
end
