defmodule ExDns.Seeder.SeedProducer do
  use GenStage
  alias ExDns.Seeder.DemandProducer
  @pid_queue Application.compile_env(:ex_dns, :pid_queue, nil)

  def start_link(args \\ nil) do
    GenStage.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(_args) do
    with {:ok, pid} =
           :python.start([
             {:python_path,
              to_charlist(
                "/Users/ayoushchourasia/Documents/Projects/ex_dns/ex_dns/domain_generator"
              )},
             {:python, ~c"python3"}
           ]) do
      {:producer, pid}
    end
  end

  def handle_demand(demand, state) do
    result = call_python(state, demand)
    {:noreply, result, state}
  end

  def cron_job() do
    events =
      case :queue.len(@pid_queue) do
        0 ->
          {:ok, pid} =
            :python.start([
              {:python_path, to_charlist(System.cwd!() <> "/domain_generator")},
              {:python, ~c"python3"}
            ])

          :queue.in(pid, @pid_queue)

          pid
          |> call_python(5)

        _ ->
          with {{:value, pid}, _} <- :queue.out(@pid_queue) do
            pid
            |> call_python(5)
          end
      end
      DemandProducer.add(events)
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
