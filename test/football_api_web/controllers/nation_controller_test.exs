defmodule FootballApiWeb.NationControllerTest do
  use FootballApiWeb.ConnCase

  alias FootballApi.Organizations
  alias FootballApi.Organizations.Nation

  @create_attrs %{
    federationName: "some federationName",
    name: "some name",
    worldCups: 42
  }
  @update_attrs %{
    federationName: "some updated federationName",
    name: "some updated name",
    worldCups: 43
  }
  @invalid_attrs %{federationName: nil, name: nil, worldCups: nil}

  def fixture(:nation) do
    {:ok, nation} = Organizations.create_nation(@create_attrs)
    nation
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all nations", %{conn: conn} do
      conn = get(conn, Routes.nation_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create nation" do
    test "renders nation when data is valid", %{conn: conn} do
      conn = post(conn, Routes.nation_path(conn, :create), nation: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.nation_path(conn, :show, id))

      assert %{
               "id" => id,
               "federationName" => "some federationName",
               "name" => "some name",
               "worldCups" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.nation_path(conn, :create), nation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update nation" do
    setup [:create_nation]

    test "renders nation when data is valid", %{conn: conn, nation: %Nation{id: id} = nation} do
      conn = put(conn, Routes.nation_path(conn, :update, nation), nation: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.nation_path(conn, :show, id))

      assert %{
               "id" => id,
               "federationName" => "some updated federationName",
               "name" => "some updated name",
               "worldCups" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, nation: nation} do
      conn = put(conn, Routes.nation_path(conn, :update, nation), nation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete nation" do
    setup [:create_nation]

    test "deletes chosen nation", %{conn: conn, nation: nation} do
      conn = delete(conn, Routes.nation_path(conn, :delete, nation))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.nation_path(conn, :show, nation))
      end
    end
  end

  defp create_nation(_) do
    nation = fixture(:nation)
    %{nation: nation}
  end
end
