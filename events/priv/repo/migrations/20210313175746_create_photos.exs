defmodule Events.Repo.Migrations.CreatePhotos do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :body, :text

      timestamps()
    end

  end
end
