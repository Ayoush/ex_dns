defmodule ExDns.Seeder.ConsumerSupervisor do
  use DynamicSupervisor

  def start_link(), do: start_link(:ok)

  def start_link(_args) do
    DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_consumer(consumer_module, events) do
    spec = {consumer_module, events}
    DynamicSupervisor.start_child(__MODULE__, spec)
  end

  def handle_info(args, state) do
    require IEx
    IEx.pry()
  end

  def any_consumer?, do: consumers_count() > 0

  def consumers_count do
    %{active: count} = Supervisor.count_children(__MODULE__)
    count
  end
end
