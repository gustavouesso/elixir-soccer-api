defmodule FootballApiWeb.ConfederationControllerTest do
  use FootballApiWeb.ConnCase

  alias FootballApi.Organizations
  alias FootballApi.Organizations.Confederation

  @create_attrs %{
    continent: "some continent",
    initials: "some initials",
    name: "some name"
  }
  @update_attrs %{
    continent: "some updated continent",
    initials: "some updated initials",
    name: "some updated name"
  }
  @invalid_attrs %{continent: nil, initials: nil, name: nil}

  def fixture(:confederation) do
    {:ok, confederation} = Organizations.create_confederation(@create_attrs)
    confederation
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all confederations", %{conn: conn} do
      conn = get(conn, Routes.confederation_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create confederation" do
    test "renders confederation when data is valid", %{conn: conn} do
      conn = post(conn, Routes.confederation_path(conn, :create), confederation: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.confederation_path(conn, :show, id))

      assert %{
               "id" => id,
               "continent" => "some continent",
               "initials" => "some initials",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.confederation_path(conn, :create), confederation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update confederation" do
    setup [:create_confederation]

    test "renders confederation when data is valid", %{conn: conn, confederation: %Confederation{id: id} = confederation} do
      conn = put(conn, Routes.confederation_path(conn, :update, confederation), confederation: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.confederation_path(conn, :show, id))

      assert %{
               "id" => id,
               "continent" => "some updated continent",
               "initials" => "some updated initials",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, confederation: confederation} do
      conn = put(conn, Routes.confederation_path(conn, :update, confederation), confederation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete confederation" do
    setup [:create_confederation]

    test "deletes chosen confederation", %{conn: conn, confederation: confederation} do
      conn = delete(conn, Routes.confederation_path(conn, :delete, confederation))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.confederation_path(conn, :show, confederation))
      end
    end
  end

  defp create_confederation(_) do
    confederation = fixture(:confederation)
    %{confederation: confederation}
  end
end
