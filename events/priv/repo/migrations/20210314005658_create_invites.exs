defmodule Events.Repo.Migrations.CreateInvites do
  use Ecto.Migration

  def change do
    create table(:invites) do
      add :response, :string, null: false
      add :email, :string, null: false
      add :post_id, references(:posts), null: false

      timestamps()
    end
  end
end
