defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "when report file is created" do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      expected_response =
        "123456789,pizza,1,49.9pizza,1,49.9pizza,1,49.9,149.70\n" <>
          "123456789,pizza,1,49.9pizza,1,49.9pizza,1,49.9,149.70\n"

      assert response == expected_response
    end
  end
end
