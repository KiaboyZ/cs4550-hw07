# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Events.Repo.insert!(%Events.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Events.Repo
alias Events.Users.User
alias Events.Posts.Post
alias Events.Photos

defmodule Inject do
    def photo(name) do
      photos = Application.app_dir(:events, "priv/photos")
      path = Path.join(photos, name)
      {:ok, hash} = Photos.save_photo(name, path)
      hash
    end
  end
  
cowboy = Inject.photo("cowboy.png")

kia = Repo.insert!(%User{name: "kia", email: "zafar.k@northeastern.edu", photo_hash: cowboy})