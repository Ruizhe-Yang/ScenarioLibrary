within ScenarioLibrary.Examples;
model PhaseQualifiedWindows "Compare phase gating with an equivalent absolute window"
  extends Modelica.Icons.Example;
  ScenarioLibrary.Timing.PhaseSchedule schedule(n=3,boundaries={0,2,5,8}) annotation(Placement(transformation(origin={-145,78},extent={{-15,-15},{15,15}},rotation=0)));
  ScenarioLibrary.Timing.PhaseWindow phaseWindow(targetPhase=2) annotation(Placement(transformation(origin={0,77},extent={{-15,-15},{15,15}},rotation=0)));
  ScenarioLibrary.Timing.TimeWindow timeWindow(startTime=2,endTime=5) annotation(Placement(transformation(origin={0,0},extent={{-15,-15},{15,15}},rotation=0)));
  ScenarioLibrary.Timing.LocalClock localClock(referenceTime=2,stopTime=5) annotation(Placement(transformation(origin={0,-78},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.BooleanOutput phaseActive annotation(Placement(transformation(origin={155,77},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.BooleanOutput timeActive annotation(Placement(transformation(origin={155,0},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput localElapsed annotation(Placement(transformation(origin={155,-78},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(phaseWindow.active,phaseActive) annotation(Line(points={{15,77},{155,77}},color={255,0,255}));
  connect(timeWindow.active,timeActive) annotation(Line(points={{15,10.5},{155,10.5},{155,0}},color={255,0,255}));
  connect(localClock.elapsed,localElapsed) annotation(Line(points={{15,-88.5},{155,-88.5},{155,-78}},color={0,0,127}));
  connect(schedule.phaseIndex,phaseWindow.phaseIndex) annotation(Line(points={{-130,88.5},{-72.5,88.5},{-72.5,77},{-15,77}},color={255,127,0}));
  annotation(experiment(StartTime=0,StopTime=8,Interval=0.01,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true)),
    Documentation(info="<html><p><b>Purpose</b> Compare phase gating with an equivalent absolute window</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> Both windows include time 2 s and exclude time 5 s. The local clock starts at 2 s and holds at 3 s elapsed once the window closes.</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> phaseActive, timeActive and localElapsed.</p></html>"));
end PhaseQualifiedWindows;
