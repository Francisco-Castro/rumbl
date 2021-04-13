defmodule Rumbl.Accounts do

  @moduledoc """
    The Accounts context.
  """

  alias Rumbl.Accounts.{User, Video}
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

  # Start Videos
  def list_videos do
    Repo.all(Video)
  end

  def get_video!(id), do: Repo.get!(Video, id)

  def create_video(attrs \\ %{}) do
    %Video{}
    |> Video.changeset(attrs)
    |> Repo.insert()
  end

  def update_video(%Video{} = video, attrs) do
    video
    |> Video.changeset(attrs)
    |> Repo.update()
  end

  def delete_video(%Video{} = video) do
    Repo.delete(video)
  end

  def change_video(%Video{} = video, attrs \\ %{}) do
    Video.changeset(video, attrs)
  end

end
