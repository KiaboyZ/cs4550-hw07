defmodule Events.Photos.Photo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "photos" do
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(photo, attrs) do
    photo
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
