defmodule Discuss.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string, null: false
      add :provider, :string
      add :token, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
