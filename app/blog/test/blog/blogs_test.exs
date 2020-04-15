defmodule Blog.BlogsTest do
  use Blog.DataCase

  alias Blog.Blogs

  describe "articles" do
    alias Blog.Blogs.Article

    @valid_attrs %{author: 42, body: "some body", title: "some title"}
    @update_attrs %{author: 43, body: "some updated body", title: "some updated title"}
    @invalid_attrs %{author: nil, body: nil, title: nil}

    def article_fixture(attrs \\ %{}) do
      {:ok, article} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blogs.create_article()

      article
    end

    test "list_articles/0 returns all articles" do
      article = article_fixture()
      assert Blogs.list_articles() == [article]
    end

    test "get_article!/1 returns the article with given id" do
      article = article_fixture()
      assert Blogs.get_article!(article.id) == article
    end

    test "create_article/1 with valid data creates a article" do
      assert {:ok, %Article{} = article} = Blogs.create_article(@valid_attrs)
      assert article.author == 42
      assert article.body == "some body"
      assert article.title == "some title"
    end

    test "create_article/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blogs.create_article(@invalid_attrs)
    end

    test "update_article/2 with valid data updates the article" do
      article = article_fixture()
      assert {:ok, %Article{} = article} = Blogs.update_article(article, @update_attrs)
      assert article.author == 43
      assert article.body == "some updated body"
      assert article.title == "some updated title"
    end

    test "update_article/2 with invalid data returns error changeset" do
      article = article_fixture()
      assert {:error, %Ecto.Changeset{}} = Blogs.update_article(article, @invalid_attrs)
      assert article == Blogs.get_article!(article.id)
    end

    test "delete_article/1 deletes the article" do
      article = article_fixture()
      assert {:ok, %Article{}} = Blogs.delete_article(article)
      assert_raise Ecto.NoResultsError, fn -> Blogs.get_article!(article.id) end
    end

    test "change_article/1 returns a article changeset" do
      article = article_fixture()
      assert %Ecto.Changeset{} = Blogs.change_article(article)
    end
  end

  describe "users" do
    alias Blog.Blogs.User

    @valid_attrs %{id: 42, name: "some name"}
    @update_attrs %{id: 43, name: "some updated name"}
    @invalid_attrs %{id: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blogs.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Blogs.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Blogs.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Blogs.create_user(@valid_attrs)
      assert user.id == 42
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blogs.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Blogs.update_user(user, @update_attrs)
      assert user.id == 43
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Blogs.update_user(user, @invalid_attrs)
      assert user == Blogs.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Blogs.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Blogs.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Blogs.change_user(user)
    end
  end

  describe "tags" do
    alias Blog.Blogs.Tag

    @valid_attrs %{id: 42, name: "some name"}
    @update_attrs %{id: 43, name: "some updated name"}
    @invalid_attrs %{id: nil, name: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blogs.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Blogs.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Blogs.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Blogs.create_tag(@valid_attrs)
      assert tag.id == 42
      assert tag.name == "some name"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blogs.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{} = tag} = Blogs.update_tag(tag, @update_attrs)
      assert tag.id == 43
      assert tag.name == "some updated name"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Blogs.update_tag(tag, @invalid_attrs)
      assert tag == Blogs.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Blogs.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Blogs.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Blogs.change_tag(tag)
    end
  end

  describe "articles" do
    alias Blog.Blogs.Article

    @valid_attrs %{author: 42, body: "some body", id: 42, title: "some title"}
    @update_attrs %{author: 43, body: "some updated body", id: 43, title: "some updated title"}
    @invalid_attrs %{author: nil, body: nil, id: nil, title: nil}

    def article_fixture(attrs \\ %{}) do
      {:ok, article} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blogs.create_article()

      article
    end

    test "list_articles/0 returns all articles" do
      article = article_fixture()
      assert Blogs.list_articles() == [article]
    end

    test "get_article!/1 returns the article with given id" do
      article = article_fixture()
      assert Blogs.get_article!(article.id) == article
    end

    test "create_article/1 with valid data creates a article" do
      assert {:ok, %Article{} = article} = Blogs.create_article(@valid_attrs)
      assert article.author == 42
      assert article.body == "some body"
      assert article.id == 42
      assert article.title == "some title"
    end

    test "create_article/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blogs.create_article(@invalid_attrs)
    end

    test "update_article/2 with valid data updates the article" do
      article = article_fixture()
      assert {:ok, %Article{} = article} = Blogs.update_article(article, @update_attrs)
      assert article.author == 43
      assert article.body == "some updated body"
      assert article.id == 43
      assert article.title == "some updated title"
    end

    test "update_article/2 with invalid data returns error changeset" do
      article = article_fixture()
      assert {:error, %Ecto.Changeset{}} = Blogs.update_article(article, @invalid_attrs)
      assert article == Blogs.get_article!(article.id)
    end

    test "delete_article/1 deletes the article" do
      article = article_fixture()
      assert {:ok, %Article{}} = Blogs.delete_article(article)
      assert_raise Ecto.NoResultsError, fn -> Blogs.get_article!(article.id) end
    end

    test "change_article/1 returns a article changeset" do
      article = article_fixture()
      assert %Ecto.Changeset{} = Blogs.change_article(article)
    end
  end

  describe "article_tags" do
    alias Blog.Blogs.ArticleTag

    @valid_attrs %{article_id: 42, tag_id: 42}
    @update_attrs %{article_id: 43, tag_id: 43}
    @invalid_attrs %{article_id: nil, tag_id: nil}

    def article_tag_fixture(attrs \\ %{}) do
      {:ok, article_tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blogs.create_article_tag()

      article_tag
    end

    test "list_article_tags/0 returns all article_tags" do
      article_tag = article_tag_fixture()
      assert Blogs.list_article_tags() == [article_tag]
    end

    test "get_article_tag!/1 returns the article_tag with given id" do
      article_tag = article_tag_fixture()
      assert Blogs.get_article_tag!(article_tag.id) == article_tag
    end

    test "create_article_tag/1 with valid data creates a article_tag" do
      assert {:ok, %ArticleTag{} = article_tag} = Blogs.create_article_tag(@valid_attrs)
      assert article_tag.article_id == 42
      assert article_tag.tag_id == 42
    end

    test "create_article_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blogs.create_article_tag(@invalid_attrs)
    end

    test "update_article_tag/2 with valid data updates the article_tag" do
      article_tag = article_tag_fixture()
      assert {:ok, %ArticleTag{} = article_tag} = Blogs.update_article_tag(article_tag, @update_attrs)
      assert article_tag.article_id == 43
      assert article_tag.tag_id == 43
    end

    test "update_article_tag/2 with invalid data returns error changeset" do
      article_tag = article_tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Blogs.update_article_tag(article_tag, @invalid_attrs)
      assert article_tag == Blogs.get_article_tag!(article_tag.id)
    end

    test "delete_article_tag/1 deletes the article_tag" do
      article_tag = article_tag_fixture()
      assert {:ok, %ArticleTag{}} = Blogs.delete_article_tag(article_tag)
      assert_raise Ecto.NoResultsError, fn -> Blogs.get_article_tag!(article_tag.id) end
    end

    test "change_article_tag/1 returns a article_tag changeset" do
      article_tag = article_tag_fixture()
      assert %Ecto.Changeset{} = Blogs.change_article_tag(article_tag)
    end
  end

  describe "tags" do
    alias Blog.Blogs.Tag

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blogs.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Blogs.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Blogs.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Blogs.create_tag(@valid_attrs)
      assert tag.name == "some name"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blogs.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{} = tag} = Blogs.update_tag(tag, @update_attrs)
      assert tag.name == "some updated name"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Blogs.update_tag(tag, @invalid_attrs)
      assert tag == Blogs.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Blogs.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Blogs.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Blogs.change_tag(tag)
    end
  end

  describe "users" do
    alias Blog.Blogs.User

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blogs.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Blogs.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Blogs.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Blogs.create_user(@valid_attrs)
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blogs.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Blogs.update_user(user, @update_attrs)
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Blogs.update_user(user, @invalid_attrs)
      assert user == Blogs.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Blogs.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Blogs.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Blogs.change_user(user)
    end
  end
end
