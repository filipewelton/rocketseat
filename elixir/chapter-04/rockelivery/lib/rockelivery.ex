defmodule Rockelivery do
  alias Rockelivery.Users.Create, as: UserCreate
  alias Rockelivery.Users.Get, as: UserGet
  alias Rockelivery.Users.Delete, as: UserDelete
  alias Rockelivery.Users.Update, as: UpdateUser
  alias Rockelivery.Items.Create, as: ItemCreate
  alias Rockelivery.Orders.Create, as: OrderCreate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate update_user(params), to: UpdateUser, as: :call

  defdelegate create_item(params), to: ItemCreate, as: :call

  defdelegate create_order(params), to: OrderCreate, as: :call
end
