defmodule CloudFunctions.Scheduler do
  @moduledoc false
  use GenServer

  @interval 5 * 60 * 1000

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    run()
    {:ok, state}
  end

  def handle_info(:work, state) do
    run()
    {:noreply, state}
  end

  defp run do
    schedule_work()
    do_work()
  end

  defp schedule_work() do
    Process.send_after(self(), :work, @interval)
  end

  defp do_work do
    CloudFunctions.Probe.main([])
  end
end
