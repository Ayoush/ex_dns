defmodule ExDns.Seeder.SeedProducerConsumer do
  use GenStage
  alias ExDns.Seeder.SeedProducer, as: Producer

  def start_link(_args) do
    GenStage.start_link(__MODULE__, :state_doesnt_matter, name: __MODULE__)
  end

  def init(state) do
    {:producer_consumer, state, subscribe_to: [{Producer, max_demand: 10, min_demand: 5}]}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      IO.inspect(event)
    end

    {:noreply, events, state}
  end
end
