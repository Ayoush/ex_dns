import Config

# import_config "common.exs"
import_config "#{config_env()}.exs"
# config :logger, level: :debug

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

config :ex_dns, ExDns.Scheduler,
  jobs: [
    {"* * * * *", {ExDns.Seeder.SeedProducer, :cron_job, []}}
  ]

config :ex_dns, pid_queue: :queue.new()
