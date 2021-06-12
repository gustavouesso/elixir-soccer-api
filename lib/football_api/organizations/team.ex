defmodule FootballApi.Organizations.Team do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "teams" do
    field :founder, :integer
    field :name, :string
    field :leagueId, :binary_id

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :founder])
    |> validate_required([:name, :founder])
  end
end
