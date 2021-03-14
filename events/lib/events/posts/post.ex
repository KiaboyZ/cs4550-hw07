defmodule Events.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :name, :string
    field :time, :utc_datetime
    field :description, :string

    belongs_to :user, Events.Users.User
    has_many :comments, Events.Comments.Comment
    has_many :invites, Events.Invites.Invite

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:name, :time, :description, :user_id])
    |> validate_required([:name, :time, :description, :user_id])
  end
end
