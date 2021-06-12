defmodule FootballApi.OrganizationsTest do
  use FootballApi.DataCase

  alias FootballApi.Organizations

  describe "confederations" do
    alias FootballApi.Organizations.Confederation

    @valid_attrs %{continent: "some continent", initials: "some initials", name: "some name"}
    @update_attrs %{
      continent: "some updated continent",
      initials: "some updated initials",
      name: "some updated name"
    }
    @invalid_attrs %{continent: nil, initials: nil, name: nil}

    def confederation_fixture(attrs \\ %{}) do
      {:ok, confederation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organizations.create_confederation()

      confederation
    end

    test "list_confederations/0 returns all confederations" do
      confederation = confederation_fixture()
      assert Organizations.list_confederations() == [confederation]
    end

    test "get_confederation!/1 returns the confederation with given id" do
      confederation = confederation_fixture()
      assert Organizations.get_confederation!(confederation.id) == confederation
    end

    test "create_confederation/1 with valid data creates a confederation" do
      assert {:ok, %Confederation{} = confederation} =
               Organizations.create_confederation(@valid_attrs)

      assert confederation.continent == "some continent"
      assert confederation.initials == "some initials"
      assert confederation.name == "some name"
    end

    test "create_confederation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organizations.create_confederation(@invalid_attrs)
    end

    test "update_confederation/2 with valid data updates the confederation" do
      confederation = confederation_fixture()

      assert {:ok, %Confederation{} = confederation} =
               Organizations.update_confederation(confederation, @update_attrs)

      assert confederation.continent == "some updated continent"
      assert confederation.initials == "some updated initials"
      assert confederation.name == "some updated name"
    end

    test "update_confederation/2 with invalid data returns error changeset" do
      confederation = confederation_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Organizations.update_confederation(confederation, @invalid_attrs)

      assert confederation == Organizations.get_confederation!(confederation.id)
    end

    test "delete_confederation/1 deletes the confederation" do
      confederation = confederation_fixture()
      assert {:ok, %Confederation{}} = Organizations.delete_confederation(confederation)

      assert_raise Ecto.NoResultsError, fn ->
        Organizations.get_confederation!(confederation.id)
      end
    end

    test "change_confederation/1 returns a confederation changeset" do
      confederation = confederation_fixture()
      assert %Ecto.Changeset{} = Organizations.change_confederation(confederation)
    end
  end

  describe "nations" do
    alias FootballApi.Organizations.Nation

    @valid_attrs %{name: "some name", federationName: "some federationName", worldCups: 42}
    @update_attrs %{
      name: "some updated name",
      federationName: "some updated federationName",
      worldCups: 43
    }
    @invalid_attrs %{name: nil, federationName: nil, worldCups: nil}

    def nation_fixture(attrs \\ %{}) do
      {:ok, nation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organizations.create_nation()

      nation
    end

    test "list_nations/0 returns all nations" do
      nation = nation_fixture()
      assert Organizations.list_nations() == [nation]
    end

    test "get_nation!/1 returns the nation with given id" do
      nation = nation_fixture()
      assert Organizations.get_nation!(nation.id) == nation
    end

    test "create_nation/1 with valid data creates a nation" do
      assert {:ok, %Nation{} = nation} = Organizations.create_nation(@valid_attrs)
      assert nation.name == "some name"
      assert nation.federationName == "some federationName"
      assert nation.worldCups == 42
    end

    test "create_nation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organizations.create_nation(@invalid_attrs)
    end

    test "update_nation/2 with valid data updates the nation" do
      nation = nation_fixture()
      assert {:ok, %Nation{} = nation} = Organizations.update_nation(nation, @update_attrs)
      assert nation.name == "some updated name"
      assert nation.federationName == "some updated federationName"
      assert nation.worldCups == 43
    end

    test "update_nation/2 with invalid data returns error changeset" do
      nation = nation_fixture()
      assert {:error, %Ecto.Changeset{}} = Organizations.update_nation(nation, @invalid_attrs)
      assert nation == Organizations.get_nation!(nation.id)
    end

    test "delete_nation/1 deletes the nation" do
      nation = nation_fixture()
      assert {:ok, %Nation{}} = Organizations.delete_nation(nation)
      assert_raise Ecto.NoResultsError, fn -> Organizations.get_nation!(nation.id) end
    end

    test "change_nation/1 returns a nation changeset" do
      nation = nation_fixture()
      assert %Ecto.Changeset{} = Organizations.change_nation(nation)
    end
  end

  describe "leagues" do
    alias FootballApi.Organizations.League

    @valid_attrs %{firstContinentalChampionshipQty: 42, name: "some name", numberOfTeams: 42, secondContinentalChampionshipQty: 42}
    @update_attrs %{firstContinentalChampionshipQty: 43, name: "some updated name", numberOfTeams: 43, secondContinentalChampionshipQty: 43}
    @invalid_attrs %{firstContinentalChampionshipQty: nil, name: nil, numberOfTeams: nil, secondContinentalChampionshipQty: nil}

    def league_fixture(attrs \\ %{}) do
      {:ok, league} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organizations.create_league()

      league
    end

    test "list_leagues/0 returns all leagues" do
      league = league_fixture()
      assert Organizations.list_leagues() == [league]
    end

    test "get_league!/1 returns the league with given id" do
      league = league_fixture()
      assert Organizations.get_league!(league.id) == league
    end

    test "create_league/1 with valid data creates a league" do
      assert {:ok, %League{} = league} = Organizations.create_league(@valid_attrs)
      assert league.firstContinentalChampionshipQty == 42
      assert league.name == "some name"
      assert league.numberOfTeams == 42
      assert league.secondContinentalChampionshipQty == 42
    end

    test "create_league/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organizations.create_league(@invalid_attrs)
    end

    test "update_league/2 with valid data updates the league" do
      league = league_fixture()
      assert {:ok, %League{} = league} = Organizations.update_league(league, @update_attrs)
      assert league.firstContinentalChampionshipQty == 43
      assert league.name == "some updated name"
      assert league.numberOfTeams == 43
      assert league.secondContinentalChampionshipQty == 43
    end

    test "update_league/2 with invalid data returns error changeset" do
      league = league_fixture()
      assert {:error, %Ecto.Changeset{}} = Organizations.update_league(league, @invalid_attrs)
      assert league == Organizations.get_league!(league.id)
    end

    test "delete_league/1 deletes the league" do
      league = league_fixture()
      assert {:ok, %League{}} = Organizations.delete_league(league)
      assert_raise Ecto.NoResultsError, fn -> Organizations.get_league!(league.id) end
    end

    test "change_league/1 returns a league changeset" do
      league = league_fixture()
      assert %Ecto.Changeset{} = Organizations.change_league(league)
    end
  end

  describe "positions" do
    alias FootballApi.Organizations.Position

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def position_fixture(attrs \\ %{}) do
      {:ok, position} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organizations.create_position()

      position
    end

    test "list_positions/0 returns all positions" do
      position = position_fixture()
      assert Organizations.list_positions() == [position]
    end

    test "get_position!/1 returns the position with given id" do
      position = position_fixture()
      assert Organizations.get_position!(position.id) == position
    end

    test "create_position/1 with valid data creates a position" do
      assert {:ok, %Position{} = position} = Organizations.create_position(@valid_attrs)
      assert position.name == "some name"
    end

    test "create_position/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organizations.create_position(@invalid_attrs)
    end

    test "update_position/2 with valid data updates the position" do
      position = position_fixture()
      assert {:ok, %Position{} = position} = Organizations.update_position(position, @update_attrs)
      assert position.name == "some updated name"
    end

    test "update_position/2 with invalid data returns error changeset" do
      position = position_fixture()
      assert {:error, %Ecto.Changeset{}} = Organizations.update_position(position, @invalid_attrs)
      assert position == Organizations.get_position!(position.id)
    end

    test "delete_position/1 deletes the position" do
      position = position_fixture()
      assert {:ok, %Position{}} = Organizations.delete_position(position)
      assert_raise Ecto.NoResultsError, fn -> Organizations.get_position!(position.id) end
    end

    test "change_position/1 returns a position changeset" do
      position = position_fixture()
      assert %Ecto.Changeset{} = Organizations.change_position(position)
    end
  end

  describe "teams" do
    alias FootballApi.Organizations.Team

    @valid_attrs %{founder: 42, name: "some name"}
    @update_attrs %{founder: 43, name: "some updated name"}
    @invalid_attrs %{founder: nil, name: nil}

    def team_fixture(attrs \\ %{}) do
      {:ok, team} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organizations.create_team()

      team
    end

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Organizations.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Organizations.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = Organizations.create_team(@valid_attrs)
      assert team.founder == 42
      assert team.name == "some name"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organizations.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      assert {:ok, %Team{} = team} = Organizations.update_team(team, @update_attrs)
      assert team.founder == 43
      assert team.name == "some updated name"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Organizations.update_team(team, @invalid_attrs)
      assert team == Organizations.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Organizations.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Organizations.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Organizations.change_team(team)
    end
  end

  describe "players" do
    alias FootballApi.Organizations.Player

    @valid_attrs %{birthday: ~N[2010-04-17 14:00:00], foot: "some foot", height: 120.5, name: "some name", weight: 120.5}
    @update_attrs %{birthday: ~N[2011-05-18 15:01:01], foot: "some updated foot", height: 456.7, name: "some updated name", weight: 456.7}
    @invalid_attrs %{birthday: nil, foot: nil, height: nil, name: nil, weight: nil}

    def player_fixture(attrs \\ %{}) do
      {:ok, player} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organizations.create_player()

      player
    end

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert Organizations.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert Organizations.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      assert {:ok, %Player{} = player} = Organizations.create_player(@valid_attrs)
      assert player.birthday == ~N[2010-04-17 14:00:00]
      assert player.foot == "some foot"
      assert player.height == 120.5
      assert player.name == "some name"
      assert player.weight == 120.5
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organizations.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      assert {:ok, %Player{} = player} = Organizations.update_player(player, @update_attrs)
      assert player.birthday == ~N[2011-05-18 15:01:01]
      assert player.foot == "some updated foot"
      assert player.height == 456.7
      assert player.name == "some updated name"
      assert player.weight == 456.7
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = Organizations.update_player(player, @invalid_attrs)
      assert player == Organizations.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = Organizations.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Organizations.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = Organizations.change_player(player)
    end
  end

  describe "matchs" do
    alias FootballApi.Organizations.Match

    @valid_attrs %{awayGoals: 42, awayRedCards: 42, awayYellowCards: 42, homeGoals: 42, homeRedCards: 42, homeYellowCards: 42}
    @update_attrs %{awayGoals: 43, awayRedCards: 43, awayYellowCards: 43, homeGoals: 43, homeRedCards: 43, homeYellowCards: 43}
    @invalid_attrs %{awayGoals: nil, awayRedCards: nil, awayYellowCards: nil, homeGoals: nil, homeRedCards: nil, homeYellowCards: nil}

    def match_fixture(attrs \\ %{}) do
      {:ok, match} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organizations.create_match()

      match
    end

    test "list_matchs/0 returns all matchs" do
      match = match_fixture()
      assert Organizations.list_matchs() == [match]
    end

    test "get_match!/1 returns the match with given id" do
      match = match_fixture()
      assert Organizations.get_match!(match.id) == match
    end

    test "create_match/1 with valid data creates a match" do
      assert {:ok, %Match{} = match} = Organizations.create_match(@valid_attrs)
      assert match.awayGoals == 42
      assert match.awayRedCards == 42
      assert match.awayYellowCards == 42
      assert match.homeGoals == 42
      assert match.homeRedCards == 42
      assert match.homeYellowCards == 42
    end

    test "create_match/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organizations.create_match(@invalid_attrs)
    end

    test "update_match/2 with valid data updates the match" do
      match = match_fixture()
      assert {:ok, %Match{} = match} = Organizations.update_match(match, @update_attrs)
      assert match.awayGoals == 43
      assert match.awayRedCards == 43
      assert match.awayYellowCards == 43
      assert match.homeGoals == 43
      assert match.homeRedCards == 43
      assert match.homeYellowCards == 43
    end

    test "update_match/2 with invalid data returns error changeset" do
      match = match_fixture()
      assert {:error, %Ecto.Changeset{}} = Organizations.update_match(match, @invalid_attrs)
      assert match == Organizations.get_match!(match.id)
    end

    test "delete_match/1 deletes the match" do
      match = match_fixture()
      assert {:ok, %Match{}} = Organizations.delete_match(match)
      assert_raise Ecto.NoResultsError, fn -> Organizations.get_match!(match.id) end
    end

    test "change_match/1 returns a match changeset" do
      match = match_fixture()
      assert %Ecto.Changeset{} = Organizations.change_match(match)
    end
  end
end
