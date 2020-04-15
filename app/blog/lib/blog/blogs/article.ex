defmodule Blog.Blogs.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :author, :integer
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :body, :author])
    |> validate_required([:title, :body, :author])
  end
end
