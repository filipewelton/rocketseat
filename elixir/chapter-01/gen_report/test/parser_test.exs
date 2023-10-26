defmodule GenReport.ParserTest do
  use ExUnit.Case

  alias GenReport.Parser

  describe "parse_file/1" do
    test "parses the file" do
      filename = "report_test.csv"
      [head | _tail] = filename
        |> Parser.open_file()
      expected_response = ["Daniele", 7, 29, 4, "2018"]

      assert head == expected_response
    end
  end
end
