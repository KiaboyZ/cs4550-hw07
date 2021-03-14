defmodule Events.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :string, null: false
      add :user_id, references(:users), null: false
      add :post_id, references(:posts), null: false

      timestamps()
    end
  end
end
