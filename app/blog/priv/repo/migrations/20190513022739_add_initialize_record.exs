defmodule Blog.Repo.Migrations.AddInitializeRecord do
  use Ecto.Migration
  alias Blog.Repo
  alias Blog.Blogs.{Article, User}

  def change do
    Repo.insert(%User{id: 1, name: "テストの筆者"})
    Repo.insert(%Article{title: "最初のブログ", body: "こんにちは、テストです。", author: 1})
  end
end
