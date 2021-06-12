defmodule FootballApi.Organizations do
  @moduledoc """
  The Organizations context.
  """

  import Ecto.Query, warn: false
  alias FootballApi.Repo

  alias FootballApi.Organizations.Confederation

  @doc """
  Returns the list of confederations.

  ## Examples

      iex> list_confederations()
      [%Confederation{}, ...]

  """
  def list_confederations do
    Repo.all(Confederation)
  end

  @doc """
  Gets a single confederation.

  Raises `Ecto.NoResultsError` if the Confederation does not exist.

  ## Examples

      iex> get_confederation!(123)
      %Confederation{}

      iex> get_confederation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_confederation!(id), do: Repo.get!(Confederation, id)

  @doc """
  Creates a confederation.

  ## Examples

      iex> create_confederation(%{field: value})
      {:ok, %Confederation{}}

      iex> create_confederation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_confederation(attrs \\ %{}) do
    %Confederation{}
    |> Confederation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a confederation.

  ## Examples

      iex> update_confederation(confederation, %{field: new_value})
      {:ok, %Confederation{}}

      iex> update_confederation(confederation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_confederation(%Confederation{} = confederation, attrs) do
    confederation
    |> Confederation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a confederation.

  ## Examples

      iex> delete_confederation(confederation)
      {:ok, %Confederation{}}

      iex> delete_confederation(confederation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_confederation(%Confederation{} = confederation) do
    Repo.delete(confederation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking confederation changes.

  ## Examples

      iex> change_confederation(confederation)
      %Ecto.Changeset{data: %Confederation{}}

  """
  def change_confederation(%Confederation{} = confederation, attrs \\ %{}) do
    Confederation.changeset(confederation, attrs)
  end

  alias FootballApi.Organizations.Nation

  @doc """
  Returns the list of nations.

  ## Examples

      iex> list_nations()
      [%Nation{}, ...]

  """
  def list_nations do
    Repo.all(Nation)
  end

  @doc """
  Gets a single nation.

  Raises `Ecto.NoResultsError` if the Nation does not exist.

  ## Examples

      iex> get_nation!(123)
      %Nation{}

      iex> get_nation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_nation!(id), do: Repo.get!(Nation, id)

  @doc """
  Creates a nation.

  ## Examples

      iex> create_nation(%{field: value})
      {:ok, %Nation{}}

      iex> create_nation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_nation(attrs \\ %{}) do
    %Nation{}
    |> Nation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a nation.

  ## Examples

      iex> update_nation(nation, %{field: new_value})
      {:ok, %Nation{}}

      iex> update_nation(nation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_nation(%Nation{} = nation, attrs) do
    nation
    |> Nation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a nation.

  ## Examples

      iex> delete_nation(nation)
      {:ok, %Nation{}}

      iex> delete_nation(nation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_nation(%Nation{} = nation) do
    Repo.delete(nation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking nation changes.

  ## Examples

      iex> change_nation(nation)
      %Ecto.Changeset{data: %Nation{}}

  """
  def change_nation(%Nation{} = nation, attrs \\ %{}) do
    Nation.changeset(nation, attrs)
  end

  alias FootballApi.Organizations.League

  @doc """
  Returns the list of leagues.

  ## Examples

      iex> list_leagues()
      [%League{}, ...]

  """
  def list_leagues do
    Repo.all(League)
  end

  @doc """
  Gets a single league.

  Raises `Ecto.NoResultsError` if the League does not exist.

  ## Examples

      iex> get_league!(123)
      %League{}

      iex> get_league!(456)
      ** (Ecto.NoResultsError)

  """
  def get_league!(id), do: Repo.get!(League, id)

  @doc """
  Creates a league.

  ## Examples

      iex> create_league(%{field: value})
      {:ok, %League{}}

      iex> create_league(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_league(attrs \\ %{}) do
    %League{}
    |> League.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a league.

  ## Examples

      iex> update_league(league, %{field: new_value})
      {:ok, %League{}}

      iex> update_league(league, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_league(%League{} = league, attrs) do
    league
    |> League.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a league.

  ## Examples

      iex> delete_league(league)
      {:ok, %League{}}

      iex> delete_league(league)
      {:error, %Ecto.Changeset{}}

  """
  def delete_league(%League{} = league) do
    Repo.delete(league)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking league changes.

  ## Examples

      iex> change_league(league)
      %Ecto.Changeset{data: %League{}}

  """
  def change_league(%League{} = league, attrs \\ %{}) do
    League.changeset(league, attrs)
  end

  alias FootballApi.Organizations.Position

  @doc """
  Returns the list of positions.

  ## Examples

      iex> list_positions()
      [%Position{}, ...]

  """
  def list_positions do
    Repo.all(Position)
  end

  @doc """
  Gets a single position.

  Raises `Ecto.NoResultsError` if the Position does not exist.

  ## Examples

      iex> get_position!(123)
      %Position{}

      iex> get_position!(456)
      ** (Ecto.NoResultsError)

  """
  def get_position!(id), do: Repo.get!(Position, id)

  @doc """
  Creates a position.

  ## Examples

      iex> create_position(%{field: value})
      {:ok, %Position{}}

      iex> create_position(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_position(attrs \\ %{}) do
    %Position{}
    |> Position.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a position.

  ## Examples

      iex> update_position(position, %{field: new_value})
      {:ok, %Position{}}

      iex> update_position(position, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_position(%Position{} = position, attrs) do
    position
    |> Position.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a position.

  ## Examples

      iex> delete_position(position)
      {:ok, %Position{}}

      iex> delete_position(position)
      {:error, %Ecto.Changeset{}}

  """
  def delete_position(%Position{} = position) do
    Repo.delete(position)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking position changes.

  ## Examples

      iex> change_position(position)
      %Ecto.Changeset{data: %Position{}}

  """
  def change_position(%Position{} = position, attrs \\ %{}) do
    Position.changeset(position, attrs)
  end

  alias FootballApi.Organizations.Team

  @doc """
  Returns the list of teams.

  ## Examples

      iex> list_teams()
      [%Team{}, ...]

  """
  def list_teams do
    Repo.all(Team)
  end

  @doc """
  Gets a single team.

  Raises `Ecto.NoResultsError` if the Team does not exist.

  ## Examples

      iex> get_team!(123)
      %Team{}

      iex> get_team!(456)
      ** (Ecto.NoResultsError)

  """
  def get_team!(id), do: Repo.get!(Team, id)

  @doc """
  Creates a team.

  ## Examples

      iex> create_team(%{field: value})
      {:ok, %Team{}}

      iex> create_team(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_team(attrs \\ %{}) do
    %Team{}
    |> Team.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a team.

  ## Examples

      iex> update_team(team, %{field: new_value})
      {:ok, %Team{}}

      iex> update_team(team, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_team(%Team{} = team, attrs) do
    team
    |> Team.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a team.

  ## Examples

      iex> delete_team(team)
      {:ok, %Team{}}

      iex> delete_team(team)
      {:error, %Ecto.Changeset{}}

  """
  def delete_team(%Team{} = team) do
    Repo.delete(team)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking team changes.

  ## Examples

      iex> change_team(team)
      %Ecto.Changeset{data: %Team{}}

  """
  def change_team(%Team{} = team, attrs \\ %{}) do
    Team.changeset(team, attrs)
  end

  alias FootballApi.Organizations.Player

  @doc """
  Returns the list of players.

  ## Examples

      iex> list_players()
      [%Player{}, ...]

  """
  def list_players do
    Repo.all(Player)
  end

  @doc """
  Gets a single player.

  Raises `Ecto.NoResultsError` if the Player does not exist.

  ## Examples

      iex> get_player!(123)
      %Player{}

      iex> get_player!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player!(id), do: Repo.get!(Player, id)

  @doc """
  Creates a player.

  ## Examples

      iex> create_player(%{field: value})
      {:ok, %Player{}}

      iex> create_player(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player(attrs \\ %{}) do
    %Player{}
    |> Player.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player.

  ## Examples

      iex> update_player(player, %{field: new_value})
      {:ok, %Player{}}

      iex> update_player(player, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player(%Player{} = player, attrs) do
    player
    |> Player.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a player.

  ## Examples

      iex> delete_player(player)
      {:ok, %Player{}}

      iex> delete_player(player)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player(%Player{} = player) do
    Repo.delete(player)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player changes.

  ## Examples

      iex> change_player(player)
      %Ecto.Changeset{data: %Player{}}

  """
  def change_player(%Player{} = player, attrs \\ %{}) do
    Player.changeset(player, attrs)
  end

  alias FootballApi.Organizations.Match

  @doc """
  Returns the list of matchs.

  ## Examples

      iex> list_matchs()
      [%Match{}, ...]

  """
  def list_matchs do
    Repo.all(Match)
  end

  @doc """
  Gets a single match.

  Raises `Ecto.NoResultsError` if the Match does not exist.

  ## Examples

      iex> get_match!(123)
      %Match{}

      iex> get_match!(456)
      ** (Ecto.NoResultsError)

  """
  def get_match!(id), do: Repo.get!(Match, id)

  @doc """
  Creates a match.

  ## Examples

      iex> create_match(%{field: value})
      {:ok, %Match{}}

      iex> create_match(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_match(attrs \\ %{}) do
    %Match{}
    |> Match.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a match.

  ## Examples

      iex> update_match(match, %{field: new_value})
      {:ok, %Match{}}

      iex> update_match(match, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_match(%Match{} = match, attrs) do
    match
    |> Match.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a match.

  ## Examples

      iex> delete_match(match)
      {:ok, %Match{}}

      iex> delete_match(match)
      {:error, %Ecto.Changeset{}}

  """
  def delete_match(%Match{} = match) do
    Repo.delete(match)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking match changes.

  ## Examples

      iex> change_match(match)
      %Ecto.Changeset{data: %Match{}}

  """
  def change_match(%Match{} = match, attrs \\ %{}) do
    Match.changeset(match, attrs)
  end
end
