defmodule ExDns.Seeder.SeedConsumer do
  use GenStage
  import ExDns.Seed
  # alias ExDns.Seeder.SeedProducerConsumer, as: ProducerConsumer

  def start_link, do: start_link([])

  def start_link(args) do
    GenStage.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(args) do
    seed_data(args)
    {:stop, args}
  end
end
