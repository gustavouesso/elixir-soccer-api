defmodule FootballApi.Organizations.Match do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "matchs" do
    field :awayGoals, :integer
    field :awayRedCards, :integer
    field :awayYellowCards, :integer
    field :homeGoals, :integer
    field :homeRedCards, :integer
    field :homeYellowCards, :integer
    field :leagueId, :binary_id
    field :homeTeam, :binary_id
    field :awayTeam, :binary_id

    timestamps()
  end

  @doc false
  def changeset(match, attrs) do
    match
    |> cast(attrs, [:homeGoals, :awayGoals, :homeYellowCards, :awayYellowCards, :homeRedCards, :awayRedCards])
    |> validate_required([:homeGoals, :awayGoals, :homeYellowCards, :awayYellowCards, :homeRedCards, :awayRedCards])
  end
end
