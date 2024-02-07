defmodule ExDns.SeedSupervisor do
  use Supervisor

  def start_link(_args) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @impl true
  def init(:ok) do
    # children = [
    #   ExDns.Seeder.SeedProducer,
    #   ExDns.Seeder.SeedProducerConsumer,
    #   ExDns.Seeder.SeedConsumer
    # ]
    children = [
      ExDns.Seeder.DemandProducer,
      ExDns.Seeder.ConsumerSupervisor
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
