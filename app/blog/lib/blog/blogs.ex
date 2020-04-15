defmodule Blog.Blogs do
  @moduledoc """
  The Blogs context.
  """

  import Ecto.Query, warn: false
  alias Blog.Repo

  alias Blog.Blogs.Article
  alias Blog.Blogs.ArticleTag
  alias Blog.Blogs.Tag
  alias Blog.Blogs.User

  @doc """
  Returns the list of articles.

  ## Examples

      iex> list_articles()
      [%Article{}, ...]

  """
  def list_articles do
    article = Repo.all(Article)
  end

  @doc """
  Gets a single article.

  Raises `Ecto.NoResultsError` if the Article does not exist.

  ## Examples

      iex> get_article!(123)
      %Article{}

      iex> get_article!(456)
      ** (Ecto.NoResultsError)

  """
  def get_article!(id), do: Repo.get!(Article, id)

  @doc """
  Creates a article.

  ## Examples

      iex> create_article(%{field: value})
      {:ok, %Article{}}

      iex> create_article(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_article(attrs \\ %{}) do
    %Article{}
    |> Article.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a article.

  ## Examples

      iex> update_article(article, %{field: new_value})
      {:ok, %Article{}}

      iex> update_article(article, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_article(%Article{} = article, attrs) do
    article
    |> Article.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Article.

  ## Examples

      iex> delete_article(article)
      {:ok, %Article{}}

      iex> delete_article(article)
      {:error, %Ecto.Changeset{}}

  """
  def delete_article(%Article{} = article) do
    Repo.delete(article)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking article changes.

  ## Examples

      iex> change_article(article)
      %Ecto.Changeset{source: %Article{}}

  """
  def change_article(%Article{} = article) do
    Article.changeset(article, %{})
  end

  alias Blog.Blogs.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Blog.Blogs.Tag

  @doc """
  Returns the list of tags.

  ## Examples

      iex> list_tags()
      [%Tag{}, ...]

  """
  def list_tags do
    Repo.all(Tag)
  end

  @doc """
  Gets a single tag.

  Raises `Ecto.NoResultsError` if the Tag does not exist.

  ## Examples

      iex> get_tag!(123)
      %Tag{}

      iex> get_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tag!(id), do: Repo.get!(Tag, id)

  @doc """
  Creates a tag.

  ## Examples

      iex> create_tag(%{field: value})
      {:ok, %Tag{}}

      iex> create_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tag.

  ## Examples

      iex> update_tag(tag, %{field: new_value})
      {:ok, %Tag{}}

      iex> update_tag(tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tag(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tag.

  ## Examples

      iex> delete_tag(tag)
      {:ok, %Tag{}}

      iex> delete_tag(tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tag(%Tag{} = tag) do
    Repo.delete(tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tag changes.

  ## Examples

      iex> change_tag(tag)
      %Ecto.Changeset{source: %Tag{}}

  """
  def change_tag(%Tag{} = tag) do
    Tag.changeset(tag, %{})
  end

  alias Blog.Blogs.ArticleTag

  @doc """
  Returns the list of article_tags.

  ## Examples

      iex> list_article_tags()
      [%ArticleTag{}, ...]

  """
  def list_article_tags do
    Repo.all(ArticleTag)
  end

  @doc """
  Gets a single article_tag.

  Raises `Ecto.NoResultsError` if the Article tag does not exist.

  ## Examples

      iex> get_article_tag!(123)
      %ArticleTag{}

      iex> get_article_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_article_tag!(id), do: Repo.get!(ArticleTag, id)

  @doc """
  Creates a article_tag.

  ## Examples

      iex> create_article_tag(%{field: value})
      {:ok, %ArticleTag{}}

      iex> create_article_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_article_tag(attrs \\ %{}) do
    %ArticleTag{}
    |> ArticleTag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a article_tag.

  ## Examples

      iex> update_article_tag(article_tag, %{field: new_value})
      {:ok, %ArticleTag{}}

      iex> update_article_tag(article_tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_article_tag(%ArticleTag{} = article_tag, attrs) do
    article_tag
    |> ArticleTag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ArticleTag.

  ## Examples

      iex> delete_article_tag(article_tag)
      {:ok, %ArticleTag{}}

      iex> delete_article_tag(article_tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_article_tag(%ArticleTag{} = article_tag) do
    Repo.delete(article_tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking article_tag changes.

  ## Examples

      iex> change_article_tag(article_tag)
      %Ecto.Changeset{source: %ArticleTag{}}

  """
  def change_article_tag(%ArticleTag{} = article_tag) do
    ArticleTag.changeset(article_tag, %{})
  end
end
