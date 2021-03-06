defmodule FootballApiWeb.LeagueView do
  use FootballApiWeb, :view
  alias FootballApiWeb.LeagueView

  def render("index.json", %{leagues: leagues}) do
    %{data: render_many(leagues, LeagueView, "league.json")}
  end

  def render("show.json", %{league: league}) do
    %{data: render_one(league, LeagueView, "league.json")}
  end

  def render("league.json", %{league: league}) do
    %{id: league.id,
      name: league.name,
      numberOfTeams: league.numberOfTeams,
      firstContinentalChampionshipQty: league.firstContinentalChampionshipQty,
      secondContinentalChampionshipQty: league.secondContinentalChampionshipQty}
  end
end
