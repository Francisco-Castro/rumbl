defmodule RumblWeb.VideoController do
  use RumblWeb, :controller

  alias Rumbl.Accounts
  alias Rumbl.Accounts.Video

  def index(conn, _params) do
    videos = Video.Query.list!()
    render(conn, "index.html", videos: videos)
  end

  def new(conn, _params) do
    changeset = Video.changeset(%Video{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"video" => video_params}) do
    case Accounts.create_video(video_params) do
      {:ok, video} ->
        conn
        |> put_flash(:info, "Video created successfully.")
        |> redirect(to: Routes.video_path(conn, :show, video))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    video = Video.Query.get!(id)
    render(conn, "show.html", video: video)
  end

  def edit(conn, %{"id" => id}) do
    video = Video.Query.get!(id)
    changeset = Video.changeset(video, %{})
    render(conn, "edit.html", video: video, changeset: changeset)
  end

  def update(conn, %{"id" => id, "video" => video_params}) do
    video = Video.Query.get!(id)

    case Accounts.update_video(video, video_params) do
      {:ok, video} ->
        conn
        |> put_flash(:info, "Video updated successfully.")
        |> redirect(to: Routes.video_path(conn, :show, video))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", video: video, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    video = Video.Query.get!(id)
    {:ok, _video} = Accounts.delete_video(video)

    conn
    |> put_flash(:info, "Video deleted successfully.")
    |> redirect(to: Routes.video_path(conn, :index))
  end
end
