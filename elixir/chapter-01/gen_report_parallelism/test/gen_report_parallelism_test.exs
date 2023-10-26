defmodule GenReportParallelismTest do
  use ExUnit.Case

  alias GenReportParallelism

  describe "build/1" do
    test "When passing file name return a report" do
      filenames = [
        "part_1.csv",
        "part_2.csv",
        "part_3.csv"
      ]
      response = GenReportParallelism.build(filenames)

      assert Map.has_key?(response, :all_hours)
      assert Map.has_key?(response, :hours_per_year)
      assert Map.has_key?(response, :hours_per_month)
      assert true
    end

    test "When no filename was given, returns an error" do
      response = GenReportParallelism.build()

      assert response == {:error, "Insira o nome de um arquivo"}
    end
  end
end
