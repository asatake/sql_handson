defmodule BlogWeb.ArticleTagControllerTest do
  use BlogWeb.ConnCase

  alias Blog.Blogs

  @create_attrs %{article_id: 42, tag_id: 42}
  @update_attrs %{article_id: 43, tag_id: 43}
  @invalid_attrs %{article_id: nil, tag_id: nil}

  def fixture(:article_tag) do
    {:ok, article_tag} = Blogs.create_article_tag(@create_attrs)
    article_tag
  end

  describe "index" do
    test "lists all article_tags", %{conn: conn} do
      conn = get(conn, Routes.article_tag_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Article tags"
    end
  end

  describe "new article_tag" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.article_tag_path(conn, :new))
      assert html_response(conn, 200) =~ "New Article tag"
    end
  end

  describe "create article_tag" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.article_tag_path(conn, :create), article_tag: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.article_tag_path(conn, :show, id)

      conn = get(conn, Routes.article_tag_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Article tag"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.article_tag_path(conn, :create), article_tag: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Article tag"
    end
  end

  describe "edit article_tag" do
    setup [:create_article_tag]

    test "renders form for editing chosen article_tag", %{conn: conn, article_tag: article_tag} do
      conn = get(conn, Routes.article_tag_path(conn, :edit, article_tag))
      assert html_response(conn, 200) =~ "Edit Article tag"
    end
  end

  describe "update article_tag" do
    setup [:create_article_tag]

    test "redirects when data is valid", %{conn: conn, article_tag: article_tag} do
      conn = put(conn, Routes.article_tag_path(conn, :update, article_tag), article_tag: @update_attrs)
      assert redirected_to(conn) == Routes.article_tag_path(conn, :show, article_tag)

      conn = get(conn, Routes.article_tag_path(conn, :show, article_tag))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, article_tag: article_tag} do
      conn = put(conn, Routes.article_tag_path(conn, :update, article_tag), article_tag: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Article tag"
    end
  end

  describe "delete article_tag" do
    setup [:create_article_tag]

    test "deletes chosen article_tag", %{conn: conn, article_tag: article_tag} do
      conn = delete(conn, Routes.article_tag_path(conn, :delete, article_tag))
      assert redirected_to(conn) == Routes.article_tag_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.article_tag_path(conn, :show, article_tag))
      end
    end
  end

  defp create_article_tag(_) do
    article_tag = fixture(:article_tag)
    {:ok, article_tag: article_tag}
  end
end
