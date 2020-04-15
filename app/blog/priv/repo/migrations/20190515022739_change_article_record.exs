defmodule Blog.Repo.Migrations.ChangeArticleRecord do
  use Ecto.Migration

  def change do
    alter table("articles") do
      modify :id, :id
    end

    alter table("users") do
      modify :id, :id
    end
  end
end
