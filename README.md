# Aegis: The Framework Siege Lab

Aegis is a high-concurrency stress-testing engine built with **Elixir** and **Phoenix LiveView**. While most labs study internal stability, Aegis is designed as an "Aggressor" to benchmark the resilience of modern frontend frameworks (React, Angular, Vue) under extreme simulated load.

### The "Aegis" Mission
How much pressure can a single-threaded JavaScript environment take before the Event Loop chokes? Aegis utilizes the **BEAM VM's** ability to spawn millions of lightweight processes to simulate thousands of concurrent users, "attacking" target applications to identify their breaking points.

### Core Tech Stack
* **The Aggressor:** Elixir 1.19.5 (OTP 26) - Leveraging 16 logical cores for massive concurrency.
* **The Controller:** Phoenix LiveView - A real-time dashboard to launch "Sieges" and monitor target health.
* **The Victims:** Standardized implementations in React, Angular, and Vue.
* **The Strategy:** Supervision Trees - Ensuring the Aegis engine remains online even if a target's response causes an individual attack worker to crash.

### Comparative Features
- **The Siege Engine:** Deploy thousands of "Attack Workers" to hammer framework endpoints.
- **Visualized Attrition:** Real-time graphs showing Latency vs. Frame Drops on the target site.
- **Crash Recovery:** Demonstrates Elixir's "Let it Crash" philosophy while the target framework struggles with memory leaks or UI freezes.
- **Framework Scorecards:** Comparative data on how Angular's Change Detection vs. React's Virtual DOM handles sustained high-frequency updates.

### Local Development
1. **Clone the lab:** `git clone ...`
2. **Setup Elixir:** `mix deps.get`
3. **Launch the Siege Engine:** `mix phx.server`
4. **Visit:** `localhost:4000/lab` to select a target and begin the simulation.

---
*"Testing the limits of the modern web, one process at a time."*