defmodule Rumbl.Accounts do

@moduledoc """
  The Accounts context.
"""

alias Rumbl.Accounts.User

def list_users() do
  [
    %User{id: "1", name: "Jose", username: "josevalim"},
    %User{id: "2", name: "Bruce", username: "redrapids"},
    %User{id: "3", name: "Chris", username: "chrismccord"}
  ]
end

def get_user(id) do
  list_users()
  |> Enum.find(fn user -> user.id == id end)
  # for %User{id: user_id} = user <- list_users(), user_id == id do
    # user
  # end |> List.first()
end

def get_user_by(params) do
  [k] = Keyword.keys(params)
  [v] = Keyword.values(params)
  for u <- list_users(), Map.get(u, k) ==v do
     u
  end |> List.first()
  # list_users()
  # |> Enum.find(fn user ->
    # Enum.all?(params, fn {k, v} -> Map.get(user, k) == v end)
  # end)
end

end
