within ScenarioLibrary.Examples;
model RepeatedEventsAndDwell "Count planned events and restart an externally triggered clock"
  extends Modelica.Icons.Example;
  ScenarioLibrary.Timing.EventSequence events(n=3,times={1,2,4},eventIds={11,22,44}) annotation(Placement(transformation(origin={-115,92},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Sources.BooleanExpression condition(y=(time>=1 and time<1.2) or (time>=2 and time<2.7)) annotation(Placement(transformation(origin={-156,-17},extent={{-13,-13},{13,13}},rotation=0)));
  ScenarioLibrary.Timing.DwellTrigger dwell(dwellTime=0.3) annotation(Placement(transformation(origin={0,-12},extent={{-15,-15},{15,15}},rotation=0)));
  ScenarioLibrary.Timing.LocalClock clock(useStartInput=true,retrigger=true) annotation(Placement(transformation(origin={0,-95},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput plannedCount annotation(Placement(transformation(origin={162,92},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput dwellCount annotation(Placement(transformation(origin={162,-12},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput elapsed annotation(Placement(transformation(origin={162,-95},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(events.eventCount,plannedCount) annotation(Line(points={{-100,102.5},{162,102.5},{162,92}},color={255,127,0}));
  connect(dwell.count,dwellCount) annotation(Line(points={{15,-22.5},{162,-22.5},{162,-12}},color={255,127,0}));
  connect(clock.elapsed,elapsed) annotation(Line(points={{15,-105.5},{162,-105.5},{162,-95}},color={0,0,127}));
  connect(condition.y,dwell.condition) annotation(Line(points={{-141.7,-17},{-78.35,-17},{-78.35,-12},{-15,-12}},color={255,0,255}));
  connect(condition.y,clock.start) annotation(Line(points={{-141.7,-17},{-78.35,-17},{-78.35,-95},{-15,-95}},color={255,0,255}));
  annotation(experiment(StartTime=0,StopTime=6,Interval=0.01,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true)),
    Documentation(info="<html><p><b>Purpose</b> Count planned events and restart an externally triggered clock</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> The planned count ends at three. The short input fails the dwell test and the longer input fires at 2.3 s.</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> plannedCount, dwellCount, dwell.fired and elapsed.</p></html>"));
end RepeatedEventsAndDwell;
