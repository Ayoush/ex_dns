defmodule ExDns.Seeder.SeedConsumer do
  use GenStage
  alias ExDns.Seeder.SeedProducerConsumer, as: ProducerConsumer

  def start_link, do: start_link([])

  def start_link(_args) do
    GenStage.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(state) do
    {:consumer, state, subscribe_to: [{ProducerConsumer,  max_demand: 1, min_demand: 0}]}
  end

  def handle_events(events, from, state) do
    {:noreply, [], state}
  end
end
