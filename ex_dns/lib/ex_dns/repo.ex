defmodule ExDns.Repo do
  use Ecto.Repo, otp_app: :ex_dns, adapter: Ecto.Adapters.Postgres
  require ExDns.Utils

  for repo <- ExDns.Utils.generate_repo_names() do
    defmodule repo do
      use Ecto.Repo,
        otp_app: :ex_dns,
        adapter: Ecto.Adapters.Postgres,
        read_only: true
    end
  end

  def replica_redirection(_extension) do
    nil
  end
end
