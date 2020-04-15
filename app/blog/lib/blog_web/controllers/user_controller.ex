defmodule BlogWeb.UserController do
  use BlogWeb, :controller

  alias Blog.Blogs
  alias Blog.Blogs.User

  def index(conn, _params) do
    users = Blogs.list_users()
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = Blogs.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Blogs.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Blogs.get_user!(id)
    render(conn, "show.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = Blogs.get_user!(id)
    changeset = Blogs.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Blogs.get_user!(id)

    case Blogs.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Blogs.get_user!(id)
    {:ok, _user} = Blogs.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: Routes.user_path(conn, :index))
  end
end
