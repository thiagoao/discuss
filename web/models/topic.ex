defmodule Discuss.Topic do
  use Discuss.Web, :model

  schema "topics" do
    field :title, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> unique_constraint(:title, name: :topics_title_index)
    |> validate_required([:title])
  end
end
