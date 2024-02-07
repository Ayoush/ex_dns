defmodule ExDns.Seeder.DemandProducer do
  use GenStage
  alias ExDns.Seeder.SeedConsumer, as: Consumer
  alias ExDns.Seeder.ConsumerSupervisor, as: ConsumerSup

  def start_link, do: start_link(:ok)

  def start_link(_args) do
    GenStage.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    {:producer, %{events: []}}
  end

  def add(events) do
    GenServer.cast(__MODULE__, {:add, events})
  end

  def handle_cast({:add, events}, state) when is_list(events) do
    send(self(), events)
    {:noreply, events, state}
  end

  def handle_info(events, state) when is_list(events) do
    ConsumerSup.start_consumer(Consumer, events)
    {:noreply, [], state}
  end

  def handle_info(_, state), do: {:noreply, [], state}
end
