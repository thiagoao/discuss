defmodule Discuss.Comment do
  use Discuss.Web, :model

  @derive {Poison.Encoder, only: [:content, :user]}

  alias Discuss.{User, Topic}

  schema "comments" do
    field :content, :string
    belongs_to :user, User
    belongs_to :topic, Topic

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
