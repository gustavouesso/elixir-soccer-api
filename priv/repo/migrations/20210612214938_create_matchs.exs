defmodule FootballApi.Repo.Migrations.CreateMatchs do
  use Ecto.Migration

  def change do
    create table(:matchs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :homeGoals, :integer
      add :awayGoals, :integer
      add :homeYellowCards, :integer
      add :awayYellowCards, :integer
      add :homeRedCards, :integer
      add :awayRedCards, :integer
      add :leagueId, references(:leagues, on_delete: :nothing, type: :binary_id)
      add :homeTeam, references(:teams, on_delete: :nothing, type: :binary_id)
      add :awayTeam, references(:teams, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:matchs, [:leagueId])
    create index(:matchs, [:homeTeam])
    create index(:matchs, [:awayTeam])
  end
end
