defmodule BlogWeb.ArticleTagController do
  use BlogWeb, :controller

  alias Blog.Blogs
  alias Blog.Blogs.ArticleTag

  def index(conn, _params) do
    article_tags = Blogs.list_article_tags()
    render(conn, "index.html", article_tags: article_tags)
  end

  def new(conn, _params) do
    changeset = Blogs.change_article_tag(%ArticleTag{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"article_tag" => article_tag_params}) do
    case Blogs.create_article_tag(article_tag_params) do
      {:ok, article_tag} ->
        conn
        |> put_flash(:info, "Article tag created successfully.")
        |> redirect(to: Routes.article_tag_path(conn, :show, article_tag))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    article_tag = Blogs.get_article_tag!(id)
    render(conn, "show.html", article_tag: article_tag)
  end

  def edit(conn, %{"id" => id}) do
    article_tag = Blogs.get_article_tag!(id)
    changeset = Blogs.change_article_tag(article_tag)
    render(conn, "edit.html", article_tag: article_tag, changeset: changeset)
  end

  def update(conn, %{"id" => id, "article_tag" => article_tag_params}) do
    article_tag = Blogs.get_article_tag!(id)

    case Blogs.update_article_tag(article_tag, article_tag_params) do
      {:ok, article_tag} ->
        conn
        |> put_flash(:info, "Article tag updated successfully.")
        |> redirect(to: Routes.article_tag_path(conn, :show, article_tag))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", article_tag: article_tag, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    article_tag = Blogs.get_article_tag!(id)
    {:ok, _article_tag} = Blogs.delete_article_tag(article_tag)

    conn
    |> put_flash(:info, "Article tag deleted successfully.")
    |> redirect(to: Routes.article_tag_path(conn, :index))
  end
end
