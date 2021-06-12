defmodule FootballApiWeb.LeagueControllerTest do
  use FootballApiWeb.ConnCase

  alias FootballApi.Organizations
  alias FootballApi.Organizations.League

  @create_attrs %{
    firstContinentalChampionshipQty: 42,
    name: "some name",
    numberOfTeams: 42,
    secondContinentalChampionshipQty: 42
  }
  @update_attrs %{
    firstContinentalChampionshipQty: 43,
    name: "some updated name",
    numberOfTeams: 43,
    secondContinentalChampionshipQty: 43
  }
  @invalid_attrs %{firstContinentalChampionshipQty: nil, name: nil, numberOfTeams: nil, secondContinentalChampionshipQty: nil}

  def fixture(:league) do
    {:ok, league} = Organizations.create_league(@create_attrs)
    league
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all leagues", %{conn: conn} do
      conn = get(conn, Routes.league_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create league" do
    test "renders league when data is valid", %{conn: conn} do
      conn = post(conn, Routes.league_path(conn, :create), league: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.league_path(conn, :show, id))

      assert %{
               "id" => id,
               "firstContinentalChampionshipQty" => 42,
               "name" => "some name",
               "numberOfTeams" => 42,
               "secondContinentalChampionshipQty" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.league_path(conn, :create), league: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update league" do
    setup [:create_league]

    test "renders league when data is valid", %{conn: conn, league: %League{id: id} = league} do
      conn = put(conn, Routes.league_path(conn, :update, league), league: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.league_path(conn, :show, id))

      assert %{
               "id" => id,
               "firstContinentalChampionshipQty" => 43,
               "name" => "some updated name",
               "numberOfTeams" => 43,
               "secondContinentalChampionshipQty" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, league: league} do
      conn = put(conn, Routes.league_path(conn, :update, league), league: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete league" do
    setup [:create_league]

    test "deletes chosen league", %{conn: conn, league: league} do
      conn = delete(conn, Routes.league_path(conn, :delete, league))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.league_path(conn, :show, league))
      end
    end
  end

  defp create_league(_) do
    league = fixture(:league)
    %{league: league}
  end
end
