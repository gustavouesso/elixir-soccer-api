# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :football_api,
  ecto_repos: [FootballApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :football_api, FootballApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/e37UhA2K9lfedx01Jq/g9gFLAgmIiJeDdZY9T33pbkGxM9Qgx+nC+IA2oJ/1D76",
  render_errors: [view: FootballApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: FootballApi.PubSub,
  live_view: [signing_salt: "GhHF/3Rm"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
