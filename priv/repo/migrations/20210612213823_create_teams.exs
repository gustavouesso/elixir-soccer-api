defmodule FootballApi.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :founder, :integer
      add :leagueId, references(:leagues, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:teams, [:leagueId])
  end
end
