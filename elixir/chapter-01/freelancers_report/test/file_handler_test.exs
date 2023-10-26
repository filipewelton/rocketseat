defmodule FileHandlerTest do
  use ExUnit.Case

  alias FreelancersReport.FileHandler

  describe "open/1" do
    test "when filename is nil, return error" do
      response = FileHandler.open(nil)

      expected_response = {:error, "Filename is required"}

      assert response == expected_response
    end

    test "when filename is empty string, return error" do
      response = FileHandler.open("")

      expected_response = {:error, "Invalid filename"}

      assert response == expected_response
    end

    test "when filename is provided, return file" do
      {:ok, list} = FileHandler.open("report.csv")

      assert length(list) == 30_000
    end
  end
end
