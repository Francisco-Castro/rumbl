defmodule RumblWeb.UserController do
  use RumblWeb, :controller

  alias Rumbl.Accounts
  alias Rumbl.Accounts.User

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user(id)
    render(conn, "show.html", user: user)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    with(
      {:ok, user} <- Accounts.create_user(user_params)
    ) do

      conn
      |> put_flash(:info, "User '#{user.name}' successfully created!")
      |> redirect(to: Routes.user_path(conn, :index))
    end
  end

  def edit(conn, %{"id" => id}) do
    with(
      user <- Accounts.get_user(id)
    ) do
      changeset = User.changeset(user, %{})

      render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    with(
      user <- Accounts.get_user(id)
    ) do
      changeset = User.changeset(user, user_params)
      case Accounts.change_user(changeset) do
        {:ok, user} ->
          conn
          |> redirect(to: Routes.user_path(conn, :show, user.id))

        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "edit.html", user: user, changeset: changeset |> Map.put(:action, :update))
      end
    end
  end

  def delete(conn, %{"id" => id}) do
    with(
      user <- Accounts.get_user(id),
      {:ok, r_user} <- Accounts.remove_user(user)
    ) do

      # index(conn, %{})
      conn
      |> put_flash(:info, "User '#{r_user.name}' successfully deleted!")
      |> redirect(to: Routes.user_path(conn, :index))
    end
  end



end
