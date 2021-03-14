defmodule EventsWeb.Helpers do

    def have_current_user?(conn) do
      conn.assigns[:current_user] != nil
    end

    def current_user_id?(conn, user_id) do
        user = conn.assigns[:current_user]
        user && user.id == user_id
    end

    def current_user_id(conn) do
      user = conn.assigns[:current_user]
      user && user.id
    end

    def get_name(user_id) do
      Events.Users.get_user!(user_id).name
    end

    def is_host?(conn, host_id) do
      user = conn.assigns[:current_user]
      user && user.id == host_id
    end

    def can_delete?(conn, host_id, comment_id) do
      user = conn.assigns[:current_user]
      user && (user.id == host_id || user.id == comment_id)
    end

    def is_invited?(conn, invites) do
      user = conn.assigns[:current_user]
      user && check_invites(user.email, invites)
    end

    def is_invited_or_host?(conn, host_id, invites) do
      user = conn.assigns[:current_user]
      user && (user.id == host_id || check_invites(user.email, invites))
    end

    def check_this_invite(user_email, invite) do
      invite.email == user_email
    end

    def check_invites(user_email, invites) do
      cond do
        length(invites) == 0 ->
          false
        hd(invites).email == user_email ->
          true
        true ->
          check_invites(user_email, tl(invites))
      end
    end

    def yes(invites) do
      cond do
        length(invites) == 0 ->
          0
        hd(invites).response == "Yes" ->
          1 + yes(tl(invites))
        true ->
          yes(tl(invites))
      end
    end

    def no(invites) do
      cond do
        length(invites) == 0 ->
          0
        hd(invites).response == "No" ->
          1 + no(tl(invites))
        true ->
          no(tl(invites))
      end
    end

    def maybe(invites) do
      cond do
        length(invites) == 0 ->
          0
        hd(invites).response == "Maybe" ->
          1 + maybe(tl(invites))
        true ->
          maybe(tl(invites))
      end
    end

    def no_response(invites) do
      cond do
        length(invites) == 0 ->
          0
        hd(invites).response == "No response" ->
          1 + no_response(tl(invites))
        true ->
          no_response(tl(invites))
      end
    end


  end