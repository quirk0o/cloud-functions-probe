defmodule CloudFunctions.Scheduler do
  @moduledoc false
  use GenServer

  @interval 5 * 60 * 1000

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_work()
    {:ok, state}
  end

  def handle_info(:work, state) do
    CloudFunctions.Probe.main([])
    schedule_work()
    {:noreply, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :work, @interval)
  end
end
