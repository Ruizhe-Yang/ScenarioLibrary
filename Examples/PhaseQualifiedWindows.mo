within ScenarioLibrary.Examples;
model PhaseQualifiedWindows "Compare a phase gate with an absolute time window"
  extends Modelica.Icons.Example;
  ScenarioLibrary.Timing.PhaseSchedule schedule(n=3,boundaries={0,2,5,8})  "Three-phase absolute schedule" annotation(Placement(transformation(origin={-145,78},extent={{-15,-15},{15,15}},rotation=0)));
  ScenarioLibrary.Timing.PhaseWindow phaseWindow(targetPhase=2)  "Gate selected by phase index" annotation(Placement(transformation(origin={0,77},extent={{-15,-15},{15,15}},rotation=0)));
  ScenarioLibrary.Timing.TimeWindow timeWindow(startTime=2,endTime=5)  "Equivalent absolute-time gate" annotation(Placement(transformation(origin={0,0},extent={{-15,-15},{15,15}},rotation=0)));
  ScenarioLibrary.Timing.LocalClock localClock(referenceTime=2,stopTime=5)  "Local time capped at the end of the selected interval" annotation(Placement(transformation(origin={0,-78},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.BooleanOutput phaseActive  "The selected phase is current" annotation(Placement(transformation(origin={155,77},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.BooleanOutput timeActive  "The absolute time window is active" annotation(Placement(transformation(origin={155,0},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput localElapsed  "Elapsed time from the interval start, capped at its duration" annotation(Placement(transformation(origin={155,-78},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(phaseWindow.active,phaseActive) annotation(Line(points={{15,77},{155,77}},color={255,0,255}));
  connect(timeWindow.active,timeActive) annotation(Line(points={{15,10.5},{155,10.5},{155,0}},color={255,0,255}));
  connect(localClock.elapsed,localElapsed) annotation(Line(points={{15,-88.5},{155,-88.5},{155,-78}},color={0,0,127}));
  connect(schedule.phaseIndex,phaseWindow.phaseIndex) annotation(Line(points={{-130,88.5},{-72.5,88.5},{-72.5,77},{-15,77}},color={255,127,0}));
  annotation(experiment(StartTime=0,StopTime=8,Interval=0.01,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true)),
    Documentation(info="<html><p>Define phases with boundaries <code>{0,2,5,8}</code>. Selecting phase index 2 gives the same active interval as the absolute window <code>[2,5)</code> s.</p><p>Plot <code>phaseActive</code> and <code>timeActive</code> together. <code>localElapsed</code> starts at zero at 2 s, increases to 3 s and then holds because the local clock has an absolute stop time of 5 s.</p></html>"));
end PhaseQualifiedWindows;
