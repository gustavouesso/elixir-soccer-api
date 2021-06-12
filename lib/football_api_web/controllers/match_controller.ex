defmodule FootballApiWeb.MatchController do
  use FootballApiWeb, :controller

  alias FootballApi.Organizations
  alias FootballApi.Organizations.Match

  action_fallback FootballApiWeb.FallbackController

  def index(conn, _params) do
    matchs = Organizations.list_matchs()
    render(conn, "index.json", matchs: matchs)
  end

  def create(conn, %{"match" => match_params}) do
    with {:ok, %Match{} = match} <- Organizations.create_match(match_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.match_path(conn, :show, match))
      |> render("show.json", match: match)
    end
  end

  def show(conn, %{"id" => id}) do
    match = Organizations.get_match!(id)
    render(conn, "show.json", match: match)
  end

  def update(conn, %{"id" => id, "match" => match_params}) do
    match = Organizations.get_match!(id)

    with {:ok, %Match{} = match} <- Organizations.update_match(match, match_params) do
      render(conn, "show.json", match: match)
    end
  end

  def delete(conn, %{"id" => id}) do
    match = Organizations.get_match!(id)

    with {:ok, %Match{}} <- Organizations.delete_match(match) do
      send_resp(conn, :no_content, "")
    end
  end
end
