defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase

  import Rockelivery.Factory

  alias Rockelivery.{User, Error}
  alias Rockelivery.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = build(:user_params)
      response = Create.call(params)

      assert {:ok, %User{age: 18}} = response
    end

    test "when there are invalid params, return an error" do
      params = build(:user_params, age: 1)
      response = Create.call(params)
      %Error{result: changeset} = response
      expected_response = %{age: ["must be greater than or equal to 18"]}

      assert errors_on(changeset) == expected_response
    end
  end
end
