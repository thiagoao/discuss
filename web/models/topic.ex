defmodule Discuss.Topic do
  use Discuss.Web, :model

  alias Discuss.{User, Comment}

  schema "topics" do
    field :title, :string
    belongs_to :user, User
    has_many :comments, Comment
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> unique_constraint(:title, name: :topics_title_index)
    |> validate_required([:title])
  end
end
