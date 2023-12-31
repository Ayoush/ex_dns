defmodule ExDns.Repo do
  use Ecto.Repo, otp_app: :ex_dns, adapter: Ecto.Adapters.Postgres
end
