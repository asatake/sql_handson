defmodule BlogWeb.TagController do
  use BlogWeb, :controller

  alias Blog.Blogs
  alias Blog.Blogs.Tag

  def index(conn, _params) do
    tags = Blogs.list_tags()
    render(conn, "index.html", tags: tags)
  end

  def new(conn, _params) do
    changeset = Blogs.change_tag(%Tag{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tag" => tag_params}) do
    case Blogs.create_tag(tag_params) do
      {:ok, tag} ->
        conn
        |> put_flash(:info, "Tag created successfully.")
        |> redirect(to: Routes.tag_path(conn, :show, tag))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tag = Blogs.get_tag!(id)
    render(conn, "show.html", tag: tag)
  end

  def edit(conn, %{"id" => id}) do
    tag = Blogs.get_tag!(id)
    changeset = Blogs.change_tag(tag)
    render(conn, "edit.html", tag: tag, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tag" => tag_params}) do
    tag = Blogs.get_tag!(id)

    case Blogs.update_tag(tag, tag_params) do
      {:ok, tag} ->
        conn
        |> put_flash(:info, "Tag updated successfully.")
        |> redirect(to: Routes.tag_path(conn, :show, tag))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tag: tag, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tag = Blogs.get_tag!(id)
    {:ok, _tag} = Blogs.delete_tag(tag)

    conn
    |> put_flash(:info, "Tag deleted successfully.")
    |> redirect(to: Routes.tag_path(conn, :index))
  end
end
