defmodule FootballApiWeb.PlayerControllerTest do
  use FootballApiWeb.ConnCase

  alias FootballApi.Organizations
  alias FootballApi.Organizations.Player

  @create_attrs %{
    birthday: ~N[2010-04-17 14:00:00],
    foot: "some foot",
    height: 120.5,
    name: "some name",
    weight: 120.5
  }
  @update_attrs %{
    birthday: ~N[2011-05-18 15:01:01],
    foot: "some updated foot",
    height: 456.7,
    name: "some updated name",
    weight: 456.7
  }
  @invalid_attrs %{birthday: nil, foot: nil, height: nil, name: nil, weight: nil}

  def fixture(:player) do
    {:ok, player} = Organizations.create_player(@create_attrs)
    player
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all players", %{conn: conn} do
      conn = get(conn, Routes.player_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create player" do
    test "renders player when data is valid", %{conn: conn} do
      conn = post(conn, Routes.player_path(conn, :create), player: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.player_path(conn, :show, id))

      assert %{
               "id" => id,
               "birthday" => "2010-04-17T14:00:00",
               "foot" => "some foot",
               "height" => 120.5,
               "name" => "some name",
               "weight" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.player_path(conn, :create), player: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update player" do
    setup [:create_player]

    test "renders player when data is valid", %{conn: conn, player: %Player{id: id} = player} do
      conn = put(conn, Routes.player_path(conn, :update, player), player: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.player_path(conn, :show, id))

      assert %{
               "id" => id,
               "birthday" => "2011-05-18T15:01:01",
               "foot" => "some updated foot",
               "height" => 456.7,
               "name" => "some updated name",
               "weight" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, player: player} do
      conn = put(conn, Routes.player_path(conn, :update, player), player: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete player" do
    setup [:create_player]

    test "deletes chosen player", %{conn: conn, player: player} do
      conn = delete(conn, Routes.player_path(conn, :delete, player))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.player_path(conn, :show, player))
      end
    end
  end

  defp create_player(_) do
    player = fixture(:player)
    %{player: player}
  end
end
