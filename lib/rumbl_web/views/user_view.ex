defmodule RumblWeb.UserView do
  use RumblWeb, :view

  alias Rumbl.Accounts.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end

  def view_link(conn, %User{id: user_id}) do
    link("View", to: Routes.user_path(conn, :show, user_id))
  end

end
