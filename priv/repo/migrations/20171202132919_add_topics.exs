defmodule Discuss.Repo.Migrations.AddTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :title, :string, null: false
    end

    create unique_index(:topics, [:title])
  end
end
