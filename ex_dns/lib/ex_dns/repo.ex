defmodule ExDns.Repo do
  use Ecto.Repo, otp_app: :ex_dns, adapter: Ecto.Adapters.Postgres
  require ExDns.Utils

  for repo <- ExDns.Utils.generate_repo_names() do
    defmodule repo do
      use Ecto.Repo,
        otp_app: :ex_dns,
        adapter: Ecto.Adapters.Postgres,
        read_only: true

      def init(_, config) do
        {:ok, config ++ configure_repos()}
      end

      defp configure_repos() do
        [
          database: "ex_dns_repo",
          username: System.get_env("username"),
          password: System.get_env("password"),
          hostname: System.get_env("host"),
          pool_size: 10
        ]
      end
    end
  end

  def replica_redirection(_extension) do
    nil
  end
end
