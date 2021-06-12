defmodule FootballApiWeb.NationController do
  use FootballApiWeb, :controller

  alias FootballApi.Organizations
  alias FootballApi.Organizations.Nation

  action_fallback FootballApiWeb.FallbackController

  def index(conn, _params) do
    nations = Organizations.list_nations()
    render(conn, "index.json", nations: nations)
  end

  def create(conn, %{"nation" => nation_params}) do
    with {:ok, %Nation{} = nation} <- Organizations.create_nation(nation_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.nation_path(conn, :show, nation))
      |> render("show.json", nation: nation)
    end
  end

  def show(conn, %{"id" => id}) do
    nation = Organizations.get_nation!(id)
    render(conn, "show.json", nation: nation)
  end

  def update(conn, %{"id" => id, "nation" => nation_params}) do
    nation = Organizations.get_nation!(id)

    with {:ok, %Nation{} = nation} <- Organizations.update_nation(nation, nation_params) do
      render(conn, "show.json", nation: nation)
    end
  end

  def delete(conn, %{"id" => id}) do
    nation = Organizations.get_nation!(id)

    with {:ok, %Nation{}} <- Organizations.delete_nation(nation) do
      send_resp(conn, :no_content, "")
    end
  end
end
