defmodule FootballApiWeb.MatchView do
  use FootballApiWeb, :view
  alias FootballApiWeb.MatchView

  def render("index.json", %{matchs: matchs}) do
    %{data: render_many(matchs, MatchView, "match.json")}
  end

  def render("show.json", %{match: match}) do
    %{data: render_one(match, MatchView, "match.json")}
  end

  def render("match.json", %{match: match}) do
    %{id: match.id,
      homeGoals: match.homeGoals,
      awayGoals: match.awayGoals,
      homeYellowCards: match.homeYellowCards,
      awayYellowCards: match.awayYellowCards,
      homeRedCards: match.homeRedCards,
      awayRedCards: match.awayRedCards}
  end
end
