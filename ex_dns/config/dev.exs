import Config

config :ex_dns, ExDns.Repo,
  database: "ex_dns_repo",
  username: System.get_env("username"),
  password: System.get_env("password"),
  hostname: System.get_env("host"),
  pool_size: 10

names =
  Enum.map(
    Application.compile_env(:ex_dns, :domain_extensions, []),
    &String.to_atom("Elixir.ExDns.Repo.#{String.upcase(&1)}")
  )

for repo <- names do
  config :my_app, repo,
    database: "ex_dns_repo",
    username: System.get_env("username"),
    password: System.get_env("password"),
    hostname: System.get_env("host"),
    pool_size: 10
end
