defmodule ReportsGeneratorTest do
  use ExUnit.Case

  describe "build/1" do
    test "build the report" do
      file_name = "report_test.csv"
      response = ReportsGenerator.build(file_name)

      expected_response = %{
        "foods" => %{
          "açaí" => 1,
          "churrasco" => 2,
          "esfirra" => 3,
          "hambúrguer" => 2,
          "pastel" => 0,
          "pizza" => 2,
          "prato_feito" => 0,
          "sushi" => 0
        },
        "users" => %{
          "1" => 48,
          "10" => 36,
          "11" => 0,
          "12" => 0,
          "13" => 0,
          "14" => 0,
          "15" => 0,
          "16" => 0,
          "17" => 0,
          "18" => 0,
          "19" => 0,
          "2" => 45,
          "20" => 0,
          "21" => 0,
          "22" => 0,
          "23" => 0,
          "24" => 0,
          "25" => 0,
          "26" => 0,
          "27" => 0,
          "28" => 0,
          "29" => 0,
          "3" => 31,
          "30" => 0,
          "4" => 42,
          "5" => 49,
          "6" => 18,
          "7" => 27,
          "8" => 25,
          "9" => 24
        }
      }

      assert response == expected_response
    end
  end

  describe "build_from_many/1" do
    test "when file list is provide, build the report" do
      filenames = ["report_1.csv", "report_2.csv"]
      response = ReportsGenerator.build_from_many(filenames)

      expected_response =
        {:ok,
         %{
           "foods" => %{
             "açaí" => 25238,
             "churrasco" => 25053,
             "esfirra" => 24854,
             "hambúrguer" => 25113,
             "pastel" => 24982,
             "pizza" => 24888,
             "prato_feito" => 24957,
             "sushi" => 24915
           },
           "users" => %{
             "1" => 184_323,
             "10" => 176_567,
             "11" => 179_044,
             "12" => 185_851,
             "13" => 186_998,
             "14" => 184_853,
             "15" => 186_518,
             "16" => 182_296,
             "17" => 181_631,
             "18" => 183_243,
             "19" => 184_162,
             "2" => 181_874,
             "20" => 181_689,
             "21" => 182_222,
             "22" => 185_920,
             "23" => 184_014,
             "24" => 182_235,
             "25" => 185_008,
             "26" => 180_918,
             "27" => 183_869,
             "28" => 183_506,
             "29" => 181_974,
             "3" => 181_668,
             "30" => 184_827,
             "4" => 185_312,
             "5" => 182_675,
             "6" => 182_294,
             "7" => 183_114,
             "8" => 182_664,
             "9" => 183_312
           }
         }}

      assert response == expected_response
    end

    test "when file list is not provide, return error" do
      response = ReportsGenerator.build_from_many([])
      expected_response = {:error, "No file list was provided"}
      assert response == expected_response
    end
  end

  describe "fetch_higher_cost/2" do
    test "when the option \"users\", returns the user who spent the most" do
      file_name = "report_test.csv"

      response =
        file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fetch_higher_cost("users")

      expected_response = {:ok, {"5", 49}}

      assert response == expected_response
    end

    test "when the option \"foods\", returns the user who spent the most" do
      file_name = "report_test.csv"

      response =
        file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fetch_higher_cost("foods")

      expected_response = {:ok, {"esfirra", 3}}

      assert response == expected_response
    end

    test "when an invalida option is given, return error" do
      file_name = "report_test.csv"

      response =
        file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fetch_higher_cost("unknown")

      expected_response = {:error, "Invalid option"}

      assert response == expected_response
    end
  end
end
