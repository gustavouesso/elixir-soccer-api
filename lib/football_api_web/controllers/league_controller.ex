defmodule FootballApiWeb.LeagueController do
  use FootballApiWeb, :controller

  alias FootballApi.Organizations
  alias FootballApi.Organizations.League

  action_fallback FootballApiWeb.FallbackController

  def index(conn, _params) do
    leagues = Organizations.list_leagues()
    render(conn, "index.json", leagues: leagues)
  end

  def create(conn, %{"league" => league_params}) do
    with {:ok, %League{} = league} <- Organizations.create_league(league_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.league_path(conn, :show, league))
      |> render("show.json", league: league)
    end
  end

  def show(conn, %{"id" => id}) do
    league = Organizations.get_league!(id)
    render(conn, "show.json", league: league)
  end

  def update(conn, %{"id" => id, "league" => league_params}) do
    league = Organizations.get_league!(id)

    with {:ok, %League{} = league} <- Organizations.update_league(league, league_params) do
      render(conn, "show.json", league: league)
    end
  end

  def delete(conn, %{"id" => id}) do
    league = Organizations.get_league!(id)

    with {:ok, %League{}} <- Organizations.delete_league(league) do
      send_resp(conn, :no_content, "")
    end
  end
end
