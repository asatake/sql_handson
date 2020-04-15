defmodule Blog.Repo.Migrations.CreateArticleTags do
  use Ecto.Migration

  def change do
    create table(:article_tags) do
      add :article_id, :integer
      add :tag_id, :integer

      timestamps()
    end

  end
end
