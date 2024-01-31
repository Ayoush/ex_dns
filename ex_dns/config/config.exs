import Config

# import_config "common.exs"
import_config "#{config_env()}.exs"

config :logger,
  backends: [{LoggerFileBackend, :info}, {LoggerFileBackend, :error}]

config :logger, :info,
  path: "logs/info.log",
  level: :info

config :logger, :error,
  path: "logs/error.log",
  level: :error

config :ex_dns,
  ecto_repos: [ExDns.Repo],
  domain_extensions: ["com", "in", "edu", "tech", "io"]
