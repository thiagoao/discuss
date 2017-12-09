defmodule Discuss.User do
  use Discuss.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :provider, :string
    field :token, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :provider, :token])
    |> unique_constraint(:email, name: :users_email_index)
    |> validate_required([:name, :email, :provider, :token])
  end
end
