defmodule FootballApi.Repo.Migrations.CreateLeagues do
  use Ecto.Migration

  def change do
    create table(:leagues, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :numberOfTeams, :integer
      add :firstContinentalChampionshipQty, :integer
      add :secondContinentalChampionshipQty, :integer
      add :nationId, references(:nations, on_delete: :nothing, type: :binary_id)
      add :confederationId, references(:confederations, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:leagues, [:nationId])
    create index(:leagues, [:confederationId])
  end
end
