defmodule Rumbl.Accounts do

  @moduledoc """
    The Accounts context.
  """

  alias Rumbl.Accounts.User
  alias Rumbl.Repo

  def list_users() do
    Repo.all(User)
  end

  def get_user(id) do
    Repo.get!(User, id)
  end

  def get_user_by(params) do
    Repo.get_by!(User, params)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def change_user(changeset) do
    Repo.update(changeset)
  end

  def remove_user(%User{} = item) do
    Repo.delete(item)
  end

end
