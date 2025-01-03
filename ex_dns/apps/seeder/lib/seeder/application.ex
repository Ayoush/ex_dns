defmodule Seeder.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    Application.load(:seeder)
    topologies = Application.get_env(:libcluster, :topologies) || []
    children = [
      # Starts a worker by calling: Seeder.Worker.start_link(arg)
      {Cluster.Supervisor, [topologies, [name: Seeder.ClusterSupervisor]]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Seeder.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
