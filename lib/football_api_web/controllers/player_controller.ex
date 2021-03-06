defmodule FootballApiWeb.PlayerController do
  use FootballApiWeb, :controller

  alias FootballApi.Organizations
  alias FootballApi.Organizations.Player

  action_fallback FootballApiWeb.FallbackController

  def index(conn, _params) do
    players = Organizations.list_players()
    render(conn, "index.json", players: players)
  end

  def create(conn, %{"player" => player_params}) do
    with {:ok, %Player{} = player} <- Organizations.create_player(player_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.player_path(conn, :show, player))
      |> render("show.json", player: player)
    end
  end

  def show(conn, %{"id" => id}) do
    player = Organizations.get_player!(id)
    render(conn, "show.json", player: player)
  end

  def update(conn, %{"id" => id, "player" => player_params}) do
    player = Organizations.get_player!(id)

    with {:ok, %Player{} = player} <- Organizations.update_player(player, player_params) do
      render(conn, "show.json", player: player)
    end
  end

  def delete(conn, %{"id" => id}) do
    player = Organizations.get_player!(id)

    with {:ok, %Player{}} <- Organizations.delete_player(player) do
      send_resp(conn, :no_content, "")
    end
  end
end
