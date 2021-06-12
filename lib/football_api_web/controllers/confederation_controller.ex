defmodule FootballApiWeb.ConfederationController do
  use FootballApiWeb, :controller

  alias FootballApi.Organizations
  alias FootballApi.Organizations.Confederation

  action_fallback FootballApiWeb.FallbackController

  def index(conn, _params) do
    confederations = Organizations.list_confederations()
    render(conn, "index.json", confederations: confederations)
  end

  def create(conn, %{"confederation" => confederation_params}) do
    with {:ok, %Confederation{} = confederation} <- Organizations.create_confederation(confederation_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.confederation_path(conn, :show, confederation))
      |> render("show.json", confederation: confederation)
    end
  end

  def show(conn, %{"id" => id}) do
    confederation = Organizations.get_confederation!(id)
    render(conn, "show.json", confederation: confederation)
  end

  def update(conn, %{"id" => id, "confederation" => confederation_params}) do
    confederation = Organizations.get_confederation!(id)

    with {:ok, %Confederation{} = confederation} <- Organizations.update_confederation(confederation, confederation_params) do
      render(conn, "show.json", confederation: confederation)
    end
  end

  def delete(conn, %{"id" => id}) do
    confederation = Organizations.get_confederation!(id)

    with {:ok, %Confederation{}} <- Organizations.delete_confederation(confederation) do
      send_resp(conn, :no_content, "")
    end
  end
end
