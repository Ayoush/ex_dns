import Config
config :ex_dns, ExDns.Repo,
  database: "ex_dns_repo",
  username: System.get_env("username"),
  password: System.get_env("password"),
  hostname: System.get_env("host"),
  pool_size: 10
