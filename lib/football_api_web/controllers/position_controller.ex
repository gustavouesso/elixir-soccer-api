defmodule FootballApiWeb.PositionController do
  use FootballApiWeb, :controller

  alias FootballApi.Organizations
  alias FootballApi.Organizations.Position

  action_fallback FootballApiWeb.FallbackController

  def index(conn, _params) do
    positions = Organizations.list_positions()
    render(conn, "index.json", positions: positions)
  end

  def create(conn, %{"position" => position_params}) do
    with {:ok, %Position{} = position} <- Organizations.create_position(position_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.position_path(conn, :show, position))
      |> render("show.json", position: position)
    end
  end

  def show(conn, %{"id" => id}) do
    position = Organizations.get_position!(id)
    render(conn, "show.json", position: position)
  end

  def update(conn, %{"id" => id, "position" => position_params}) do
    position = Organizations.get_position!(id)

    with {:ok, %Position{} = position} <- Organizations.update_position(position, position_params) do
      render(conn, "show.json", position: position)
    end
  end

  def delete(conn, %{"id" => id}) do
    position = Organizations.get_position!(id)

    with {:ok, %Position{}} <- Organizations.delete_position(position) do
      send_resp(conn, :no_content, "")
    end
  end
end
