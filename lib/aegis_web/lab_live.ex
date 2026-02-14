defmodule AegisWeb.LabLive do
  use AegisWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, :tick)
    {:ok, assign(socket, workers: [], crash_count: 0)}
  end

  def render(assigns) do
    ~H"""
    <div class="p-10">
      <h1 class="text-4xl font-bold mb-5">🛡️ Aegis Resilience Lab</h1>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div class="bg-gray-800 p-6 rounded-xl shadow-xl border border-blue-500">
          <h2 class="text-xl font-semibold mb-4 text-blue-400">System Health</h2>
          <p class="text-3xl font-mono text-white">Crashes Recovered: <%= @crash_count %></p>
          <button phx-click="trigger_chaos" class="mt-4 bg-red-600 hover:bg-red-700 text-white px-6 py-2 rounded-lg font-bold transition">
            🔥 Trigger System Stress
          </button>
        </div>

        <div class="bg-gray-800 p-6 rounded-xl shadow-xl border border-green-500">
          <h2 class="text-xl font-semibold mb-4 text-green-400">Worker Status</h2>
          <div class="flex gap-2 flex-wrap">
            <%= if Enum.empty?(@workers) do %>
              <p class="text-gray-400 italic">No workers active. Trigger chaos to begin.</p>
            <% end %>
            <%= for w <- @workers do %>
              <div class="w-8 h-8 bg-green-500 rounded-sm animate-pulse" title={"Worker #{w}"}></div>
            <% end %>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def handle_event("trigger_chaos", _params, socket) do
    # Spawn a new worker that will eventually crash
    new_id = :erlang.unique_integer([:positive])
    # Note: We'll link this to a Supervisor in the next step!
    {:noreply, update(socket, :workers, & [new_id | &1])}
  end

  def handle_info(:tick, socket) do
    {:noreply, socket}
  end
end
