defmodule FootballApiWeb.ConfederationView do
  use FootballApiWeb, :view
  alias FootballApiWeb.ConfederationView

  def render("index.json", %{confederations: confederations}) do
    %{data: render_many(confederations, ConfederationView, "confederation.json")}
  end

  def render("show.json", %{confederation: confederation}) do
    %{data: render_one(confederation, ConfederationView, "confederation.json")}
  end

  def render("confederation.json", %{confederation: confederation}) do
    %{id: confederation.id,
      name: confederation.name,
      continent: confederation.continent,
      initials: confederation.initials}
  end
end
