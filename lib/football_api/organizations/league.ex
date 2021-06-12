defmodule FootballApi.Organizations.League do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "leagues" do
    field :firstContinentalChampionshipQty, :integer
    field :name, :string
    field :numberOfTeams, :integer
    field :secondContinentalChampionshipQty, :integer
    field :nationId, :binary_id
    field :confederationId, :binary_id

    timestamps()
  end

  @doc false
  def changeset(league, attrs) do
    league
    |> cast(attrs, [:name, :numberOfTeams, :firstContinentalChampionshipQty, :secondContinentalChampionshipQty])
    |> validate_required([:name, :numberOfTeams, :firstContinentalChampionshipQty, :secondContinentalChampionshipQty])
  end
end
