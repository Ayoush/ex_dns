defmodule ExDns.SeedGenServer do
  use GenServer
  alias ExDns.Seed

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  # CALLBACKS
  @impl true
  def init(state) do
    try do
      Seed.seed_data()
      {:ok, state}
    catch
      exception -> {:error, exception, state}
    end
  end
end
