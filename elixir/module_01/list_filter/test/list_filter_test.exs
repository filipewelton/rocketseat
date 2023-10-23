defmodule ListFilterTest do
  use ExUnit.Case

  describe "call/1" do
    test "should return 3" do
      list = ["1", "4", "abc", "5", "3"]
      response = ListFilter.call(list)
      expected_response = 3

      assert expected_response == response
    end

    test "should return 0" do
      list = []
      response = ListFilter.call(list)
      expected_response = 0

      assert expected_response == response
    end
  end
end
