defmodule FreelancersReportTest do
  use ExUnit.Case

  alias FreelancersReport.FileHandler

  describe "generate_reports/1" do
    test "when registers is nil" do
      response = FreelancersReport.generate_reports(nil)
      expect_response = {:error, "Registers were not provided"}

      assert response == expect_response
    end

    test "when registers is empty" do
      response = FreelancersReport.generate_reports([])
      expect_response = {:error, "Registers is empty list"}

      assert response == expect_response
    end

    test "when registers is not list" do
      response = FreelancersReport.generate_reports(true)
      expect_response = {:error, "Registers must be a list"}

      assert response == expect_response
    end

    test "when registers is an list" do
      {:ok, raw} = FileHandler.open("report_test.csv")
      response = FreelancersReport.generate_reports(raw)
      expected_response = is_map(response)

      assert expected_response
    end
  end
end
