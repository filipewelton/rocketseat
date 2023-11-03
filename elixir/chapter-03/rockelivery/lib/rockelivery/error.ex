defmodule Rockelivery.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    [{_, changeset}] = result

    %__MODULE__{
      status: status,
      result: changeset
    }
  end

  def build_user_not_found_error, do: build(:not_found, "User not found")
end
