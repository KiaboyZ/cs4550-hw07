defmodule Events.Invites.Invite do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invites" do
    field :response, :string
    field :email, :string

    belongs_to :post, Events.Posts.Post

    timestamps()
  end

  @doc false
  def changeset(invite, attrs) do
    invite
    |> cast(attrs, [:response, :email, :post_id])
    |> validate_required([:response, :email, :post_id])
  end
end
