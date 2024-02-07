defmodule ExDns.Seeder.SeedProducer do
  use GenStage


  def start_link(args \\ nil) do
    GenStage.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(_args) do
    with {:ok, pid} = :python.start([{:python_path, to_charlist("/Users/ayoushchourasia/Documents/Projects/ex_dns/ex_dns/domain_generator")},{:python, 'python3'}]) do
      {:producer, pid}
    end
  end

  def handle_demand(demand, state) do
    result = call_python(state, demand)
    {:noreply, result, state}
  end

  def call_python(pid, demand) do
    call_MFA(pid, demand)
  end

  defp call_MFA(pid, demand) do
    module = :url_generator
    function = :main
    arguments = [demand]
    Jason.decode!(:python.call(pid, module, function, arguments))
  end
end
