defmodule RumblWeb.UserView do
  use RumblWeb, :view

  alias Rumbl.Accounts.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end

  def view_link(conn, %User{id: user_id}) do
    link("View", to: Routes.user_path(conn, :show, user_id), class: "btn btn-sm btn-primary", style: "margin: 0 0 0 5px")
  end

  def edit_link(conn, %User{id: user_id}) do
    link("Edit", to: Routes.user_path(conn, :edit, user_id), class: "btn btn-sm btn-success", style: "margin: 0 0 0 5px")
  end

  def delete_link(conn, %User{id: user_id}) do
    link("Delete", to: Routes.user_path(conn, :delete, user_id), method: "delete", class: "btn btn-sm btn-danger", style: "margin: 0 0 0 5px")
  end

end
