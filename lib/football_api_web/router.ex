defmodule FootballApiWeb.Router do
  use FootballApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FootballApiWeb do
    pipe_through :api
    resources "/confederations", ConfederationController, except: [:new, :edit]
    resources "/nations", NationController, except: [:new, :edit]
    resources "/leagues", LeagueController, except: [:new, :edit]
    resources "/positions", PositionController, except: [:new, :edit]
    resources "/teams", TeamController, except: [:new, :edit]
    resources "/players", PlayerController, except: [:new, :edit]
    resources "/matchs", MatchController, except: [:new, :edit]
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: FootballApiWeb.Telemetry
    end
  end
end
