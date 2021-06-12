defmodule FootballApiWeb.MatchControllerTest do
  use FootballApiWeb.ConnCase

  alias FootballApi.Organizations
  alias FootballApi.Organizations.Match

  @create_attrs %{
    awayGoals: 42,
    awayRedCards: 42,
    awayYellowCards: 42,
    homeGoals: 42,
    homeRedCards: 42,
    homeYellowCards: 42
  }
  @update_attrs %{
    awayGoals: 43,
    awayRedCards: 43,
    awayYellowCards: 43,
    homeGoals: 43,
    homeRedCards: 43,
    homeYellowCards: 43
  }
  @invalid_attrs %{awayGoals: nil, awayRedCards: nil, awayYellowCards: nil, homeGoals: nil, homeRedCards: nil, homeYellowCards: nil}

  def fixture(:match) do
    {:ok, match} = Organizations.create_match(@create_attrs)
    match
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all matchs", %{conn: conn} do
      conn = get(conn, Routes.match_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create match" do
    test "renders match when data is valid", %{conn: conn} do
      conn = post(conn, Routes.match_path(conn, :create), match: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.match_path(conn, :show, id))

      assert %{
               "id" => id,
               "awayGoals" => 42,
               "awayRedCards" => 42,
               "awayYellowCards" => 42,
               "homeGoals" => 42,
               "homeRedCards" => 42,
               "homeYellowCards" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.match_path(conn, :create), match: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update match" do
    setup [:create_match]

    test "renders match when data is valid", %{conn: conn, match: %Match{id: id} = match} do
      conn = put(conn, Routes.match_path(conn, :update, match), match: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.match_path(conn, :show, id))

      assert %{
               "id" => id,
               "awayGoals" => 43,
               "awayRedCards" => 43,
               "awayYellowCards" => 43,
               "homeGoals" => 43,
               "homeRedCards" => 43,
               "homeYellowCards" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, match: match} do
      conn = put(conn, Routes.match_path(conn, :update, match), match: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete match" do
    setup [:create_match]

    test "deletes chosen match", %{conn: conn, match: match} do
      conn = delete(conn, Routes.match_path(conn, :delete, match))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.match_path(conn, :show, match))
      end
    end
  end

  defp create_match(_) do
    match = fixture(:match)
    %{match: match}
  end
end
