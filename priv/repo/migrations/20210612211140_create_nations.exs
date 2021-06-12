defmodule FootballApi.Repo.Migrations.CreateNations do
  use Ecto.Migration

  def change do
    create table(:nations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :"name", :string
      add :federationName, :string
      add :worldCups, :integer

      timestamps()
    end

  end
end
