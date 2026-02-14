defmodule Aegis.StressWorker do
  use GenServer
  require Logger

  def start_link(id), do: GenServer.start_link(__MODULE__, id)

  def init(id) do
    Logger.info("🛡️ Aegis Worker #{id} online.")
    # Every 2 seconds, try to perform a "dangerous" task
    :timer.send_interval(2000, :perform_task)
    {:ok, id}
  end

  def handle_info(:perform_task, id) do
    # 30% chance to simulate a catastrophic failure
    if :rand.uniform(10) > 7 do
      Logger.error("💥 CRITICAL FAILURE: Worker #{id} encountered an unhandled exception!")
      raise "Aegis Chaos Triggered"
    end

    Logger.info("⚙️ Worker #{id} processed job successfully.")
    {:noreply, id}
  end
end