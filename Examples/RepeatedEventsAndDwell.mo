within ScenarioLibrary.Examples;
model RepeatedEventsAndDwell "Compare planned event counts, dwell qualification and clock restarts"
  extends Modelica.Icons.Example;
  ScenarioLibrary.Timing.EventSequence events(n=3,times={1,2,4},eventIds={11,22,44})  "Three planned events on the absolute clock" annotation(Placement(transformation(origin={-115,92},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Sources.BooleanExpression condition(y=(time>=1 and time<1.2) or (time>=2 and time<2.7))  "Short and long intervals used for dwell qualification" annotation(Placement(transformation(origin={-156,-17},extent={{-13,-13},{13,13}},rotation=0)));
  ScenarioLibrary.Timing.DwellTrigger dwell(dwellTime=0.3)  "Qualification after a continuously true interval" annotation(Placement(transformation(origin={0,-12},extent={{-15,-15},{15,15}},rotation=0)));
  ScenarioLibrary.Timing.LocalClock clock(useStartInput=true,retrigger=true)  "Local clock restarted by each rising condition edge" annotation(Placement(transformation(origin={0,-95},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput plannedCount  "Number of scheduled events reached" annotation(Placement(transformation(origin={162,92},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput dwellCount  "Number of condition intervals meeting the dwell duration" annotation(Placement(transformation(origin={162,-12},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput elapsed  "Elapsed time since the most recent clock start" annotation(Placement(transformation(origin={162,-95},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(events.eventCount,plannedCount) annotation(Line(points={{-100,102.5},{162,102.5},{162,92}},color={255,127,0}));
  connect(dwell.count,dwellCount) annotation(Line(points={{15,-22.5},{162,-22.5},{162,-12}},color={255,127,0}));
  connect(clock.elapsed,elapsed) annotation(Line(points={{15,-105.5},{162,-105.5},{162,-95}},color={0,0,127}));
  connect(condition.y,dwell.condition) annotation(Line(points={{-141.7,-17},{-78.35,-17},{-78.35,-12},{-15,-12}},color={255,0,255}));
  connect(condition.y,clock.start) annotation(Line(points={{-141.7,-17},{-78.35,-17},{-78.35,-95},{-15,-95}},color={255,0,255}));
  annotation(experiment(StartTime=0,StopTime=6,Interval=0.01,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true)),
    Documentation(info="<html><p>Schedule events at 1, 2 and 4 s. The condition is true over <code>[1,1.2)</code> and <code>[2,2.7)</code> s. With a 0.3 s dwell, the first interval is too short and the second increments the count at 2.3 s.</p><p>The same condition starts a retriggerable local clock. Its rising edges at 1 and 2 s restart elapsed time; falling edges do not pause it. Plot <code>plannedCount</code>, <code>dwellCount</code> and <code>elapsed</code>. The dwell <code>fired</code> flag remains true after qualification until the condition clears.</p></html>"));
end RepeatedEventsAndDwell;
