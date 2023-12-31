import Config
import_config "#{config_env()}.exs"
# IO.inspect(config_env())
config :logger, level: :debug
config :ex_dns, ecto_repos: [ExDns.Repo]
