defmodule FootballApi.Organizations.Nation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "nations" do
    field :name, :string
    field :federationName, :string
    field :worldCups, :integer

    timestamps()
  end

  @doc false
  def changeset(nation, attrs) do
    nation
    |> cast(attrs, [:name, :federationName, :worldCups])
    |> validate_required([:name, :federationName, :worldCups])
  end
end
