defmodule FootballApiWeb.NationView do
  use FootballApiWeb, :view
  alias FootballApiWeb.NationView

  def render("index.json", %{nations: nations}) do
    %{data: render_many(nations, NationView, "nation.json")}
  end

  def render("show.json", %{nation: nation}) do
    %{data: render_one(nation, NationView, "nation.json")}
  end

  def render("nation.json", %{nation: nation}) do
    %{id: nation.id,
      name: nation.name,
      federationName: nation.federationName,
      worldCups: nation.worldCups}
  end
end
