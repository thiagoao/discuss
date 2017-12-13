defmodule Discuss.User do
  use Discuss.Web, :model

  alias Discuss.{Topic, Comment}

  schema "users" do
    field :name, :string
    field :email, :string
    field :provider, :string
    field :token, :string
    has_many :topics, Topic
    has_many :comments, Comment

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :provider, :token])
    |> unique_constraint(:email, name: :users_email_index)
    |> validate_required([:name, :email, :provider, :token])
  end
end
