defmodule GenReportParallelism.ParserTest do
  use ExUnit.Case

  alias GenReportParallelism.Parser

  describe "parse_file/1" do
    test "parses the file" do
      filename = "part_1.csv"

      [head | _tail] =
        filename
        |> Parser.open_file()

      expected_response = ["Daniele", 7, 29, 4, "2018"]

      assert head == expected_response
    end
  end
end
