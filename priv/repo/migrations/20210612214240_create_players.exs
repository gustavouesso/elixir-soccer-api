defmodule FootballApi.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :height, :float
      add :weight, :float
      add :birthday, :naive_datetime
      add :foot, :string
      add :teamId, references(:teams, on_delete: :nothing, type: :binary_id)
      add :positionId, references(:positions, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:players, [:teamId])
    create index(:players, [:positionId])
  end
end
