# ScenarioLibrary

## Name and purpose

Deterministic initial conditions, planned profiles, environment inputs and timing.

## Scope and non-goals

Deterministic initial-state records, load and command profiles, environment inputs, operating conditions and timing.

## Requirements

- Modelica Standard Library 4.0.0.
- Tested with OpenModelica 1.25.5 (64-bit), DASSL and relative tolerance 1e-6. 8/8 default examples completed in the recorded runs.
- Other Modelica tools are compatibility targets pending separate verification.

## Installation

Extract the source tree, load Modelica 4.0.0, then open `ScenarioLibrary/package.mo`. Confirm the Modelica version in your tool. Open an example from the package tree and use its declared experiment settings.

## Package structure

```text
ScenarioLibrary/
    UsersGuide/
    Initialization/
    Profiles/
    Environment/
    Operating/
    Timing/
    Utilities/
    Examples/
```

The model catalog lists each class, its interfaces, an example and its recorded validation level.

## Core concepts and usage

- Instantiate an Initialization record as a parameter and bind its fields explicitly to native start attributes. Set fixed=true only for intended independent initial constraints.
- Connect a profile or environment output to the corresponding host input. Use increasing table knots and explicit terminal behavior.
- Use PhaseSchedule for ordered phase boundaries, PhaseWindow for qualification, and LocalClock for elapsed time. TaskStatus accepts separate start, complete and abort inputs.

## Examples

| Example | Stop time (s) | Purpose | Suggested observables |
|---|---:|---|---|
| MechanicalInitialization | 5 | Bind independent mechanical initial states | translationalHost.s and .v, rotationalHost.phi and .w at time zero. |
| ElectricalThermalInitialization | 5 | Bind voltage, current and temperature in separate networks | capacitor.v, inductor.i and thermal.T at initialization. |
| MultiphaseMission | 10 | Drive a planned load from four half-open phases | schedule.phaseIndex, schedule.localTime, finished and demand. |
| LoadAndCommandSchedules | 6 | Share one absolute clock across load, command and mode schedules | loadOutput, commandOutput and modeOutput. |
| EnvironmentalConditions | 5 | Inspect the standard-air model and planned environmental signals | sea.T, seaPressure, sea.rho, gradeReadback, windReadback, temperatureReadback. |
| PhaseQualifiedWindows | 8 | Compare phase gating with an equivalent absolute window | phaseActive, timeActive and localElapsed. |
| RepeatedEventsAndDwell | 6 | Count planned events and restart an externally triggered clock | plannedCount, dwellCount, dwell.fired and elapsed. |
| ReusableScenario | 6 | Fan out one scenario to independent first-order hosts | scenario.y, fastResponse and slowResponse. |

## Limitations and numerical assumptions

- All absolute knots use the simulation time axis. Fixed windows include the left edge and exclude the right edge.
- The host owns dynamics and checks consistency of the selected initial constraints.
- Use the declared altitude range and coordinate conventions for environment sources.

## Version and license

Version 0.3.0. See LICENSE for the terms supplied with the original source.
