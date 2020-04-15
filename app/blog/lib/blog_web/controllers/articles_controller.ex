defmodule BlogWeb.ArticlesController do
  use BlogWeb, :controller

  alias Blog.Blogs
  alias Blog.Blogs.Article
  alias Blog.Blogs.User

  def index(conn, _params) do
    articles = Blogs.list_articles()
    users = Blogs.list_users()
    data = concat(articles, users)
    IO.inspect data
    render(conn, "index.html", data: data)
  end

  defp concat(articles, users) do
    articles |> Enum.map(fn x -> %{title: x.title, body: x.body, author: search(x, users)} end)
  end

  defp search(article, users) do
    author = article.author
    r = users |> Enum.filter(fn x -> x.id == author end)
    result = r |> Enum.at(0)
    result.name
  end

  def new(conn, _params) do
    changeset = Blogs.change_article(%Article{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"article" => article_params}) do
    case Blogs.create_article(article_params) do
      {:ok, article} ->
        conn
        |> put_flash(:info, "Article created successfully.")
        |> redirect(to: Routes.article_path(conn, :show, article))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    article = Blogs.get_article!(id)
    render(conn, "show.html", article: article)
  end

  def edit(conn, %{"id" => id}) do
    article = Blogs.get_article!(id)
    changeset = Blogs.change_article(article)
    render(conn, "edit.html", article: article, changeset: changeset)
  end

  def update(conn, %{"id" => id, "article" => article_params}) do
    article = Blogs.get_article!(id)

    case Blogs.update_article(article, article_params) do
      {:ok, article} ->
        conn
        |> put_flash(:info, "Article updated successfully.")
        |> redirect(to: Routes.article_path(conn, :show, article))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", article: article, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    article = Blogs.get_article!(id)
    {:ok, _article} = Blogs.delete_article(article)

    conn
    |> put_flash(:info, "Article deleted successfully.")
    |> redirect(to: Routes.article_path(conn, :index))
  end
end
