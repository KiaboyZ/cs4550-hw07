defmodule Events.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :name, :string, null: false
      add :time, :Date, null: false
      add :description, :string, null: false

      timestamps()
    end

  end
end