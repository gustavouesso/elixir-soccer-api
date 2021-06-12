defmodule FootballApi.Repo.Migrations.CreateConfederations do
  use Ecto.Migration

  def change do
    create table(:confederations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :continent, :string
      add :initials, :string

      timestamps()
    end

  end
end
