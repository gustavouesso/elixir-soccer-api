defmodule FootballApi.Organizations.Confederation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "confederations" do
    field :continent, :string
    field :initials, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(confederation, attrs) do
    confederation
    |> cast(attrs, [:name, :continent, :initials])
    |> validate_required([:name, :continent, :initials])
  end
end
