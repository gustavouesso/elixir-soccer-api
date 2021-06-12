defmodule FootballApi.Repo do
  use Ecto.Repo,
    otp_app: :football_api,
    adapter: Ecto.Adapters.Postgres
end
