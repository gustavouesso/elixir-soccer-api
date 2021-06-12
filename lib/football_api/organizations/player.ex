defmodule FootballApi.Organizations.Player do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "players" do
    field :birthday, :naive_datetime
    field :foot, :string
    field :height, :float
    field :name, :string
    field :weight, :float
    field :teamId, :binary_id
    field :positionId, :binary_id

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name, :height, :weight, :birthday, :foot])
    |> validate_required([:name, :height, :weight, :birthday, :foot])
  end
end
