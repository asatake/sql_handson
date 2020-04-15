defmodule Blog.Blogs.ArticleTag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "article_tags" do
    field :article_id, :integer
    field :tag_id, :integer

    timestamps()
  end

  @doc false
  def changeset(article_tag, attrs) do
    article_tag
    |> cast(attrs, [:article_id, :tag_id])
    |> validate_required([:article_id, :tag_id])
  end
end
