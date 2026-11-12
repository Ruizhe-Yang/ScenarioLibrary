# Changelog

## 0.3.0

- Rename `ScenarioConfigurationLibrary` to `ScenarioLibrary`.
- Group initial states, profiles, planned environment, operating conditions and timing.
- Make phase edges, event counts, local time and task priority explicit.
- Replace old demonstrations with fixed independent host examples.

### Migration

- PhaseSchedule accepts explicit boundary times and phase IDs. Where an existing duration-based caller needs its original interface, Timing.PhaseScheduler remains available.
- Bind initial-state record fields in the host declaration and preserve fixed attributes according to the intended initial-state constraints.
