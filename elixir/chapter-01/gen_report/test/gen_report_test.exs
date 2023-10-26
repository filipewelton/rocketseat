defmodule GenReportTest do
  use ExUnit.Case

  alias GenReport

  @file_name "report.csv"

  describe "build/1" do
    test "When passing file name return a report" do
      response = GenReport.build(@file_name)

      assert Map.has_key?(response, :all_hours)
      assert Map.has_key?(response, :hours_per_year)
      assert Map.has_key?(response, :hours_per_month)
      assert true
    end

    test "When no filename was given, returns an error" do
      response = GenReport.build()

      assert response == {:error, "Insira o nome de um arquivo"}
    end
  end
end
