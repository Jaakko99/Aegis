
# Aegis: Resilience & Chaos Lab

Aegis is a fault-tolerant simulation environment built with **Elixir** and **Phoenix LiveView**. It demonstrates the power of the **BEAM VM** (Erlang) by simulating system-wide stress, process crashes, and automated recovery via Supervision Trees.

### The "Aegis" Goal
In most systems, a crash is a disaster. In Aegis, a crash is a planned event. This lab utilizes **GenServers** to handle "unreliable" work and **Supervisors** to act as the shield, ensuring zero downtime even when individual workers encounter critical failures.

### Core Tech Stack
* **Language:** Elixir 1.19.5 (OTP 26)
* **Framework:** Phoenix (LiveView for real-time monitoring)
* **Runtime:** The BEAM (Erlang Virtual Machine)
* **Design Pattern:** Supervision Trees (Let It Crash)

### Key Features
- **Deterministic Chaos:** Simulated workers with randomized failure rates.
- **Self-Healing:** Supervision strategies that restart crashed processes in milliseconds.
- **Process Isolation:** Proving that a failure in one worker cannot bring down the entire node.
- **Real-time Visualization:** (Planned) A LiveView dashboard to watch the "Shield" in action.

### Local Development
To run the Aegis lab locally:

1. Install Erlang/OTP 26 and Elixir 1.19.
2. Clone this repo.
3. Install dependencies: `mix deps.get`
4. Start the server: `mix phx.server`
5. Visit `localhost:4000` to see the heartbeat.

*Built to explore the limits of fault-tolerant distributed systems.*