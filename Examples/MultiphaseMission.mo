within ScenarioLibrary.Examples;
model MultiphaseMission "Generate a planned load from four consecutive phases"
  extends Modelica.Icons.Example;
  ScenarioLibrary.Timing.PhaseSchedule schedule(n=4,boundaries={0,1,3,7,10},phaseIds={1,2,3,4})  "Four-phase absolute schedule" annotation(Placement(transformation(origin={-140,25},extent={{-15,-15},{15,15}},rotation=0)));
  ScenarioLibrary.Utilities.Views.PhaseLoad profile  "Planned load associated with the phase index and local time" annotation(Placement(transformation(origin={20,20},extent={{-17,-17},{17,17}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput demand  "Planned load command" annotation(Placement(transformation(origin={165,20},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.BooleanOutput finished  "The schedule has reached its final boundary" annotation(Placement(transformation(origin={165,-75},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(schedule.phaseIndex,profile.phaseIndex) annotation(Line(points={{-125,35.5},{-61,35.5},{-61,31.9},{3,31.9}},color={255,127,0}));
  connect(schedule.localTime,profile.localTime) annotation(Line(points={{-125,21.50001},{-120,21.50001},{-120,8.1},{3,8.1}},color={0,0,127}));
  connect(profile.demand,demand) annotation(Line(points={{37,20},{165,20}},color={0,0,127}));
  connect(schedule.completed,finished) annotation(Line(points={{-125,14.5},{-119,14.5},{-119,-75},{165,-75}},color={255,0,255}));
  annotation(experiment(StartTime=0,StopTime=10,Interval=0.01,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true),graphics={Text(extent={{-150,119},{150,105}},textString="Prepare, load, hold and unload",textColor={34,61,73})}),
    Documentation(info="<html><p>Use boundaries <code>{0,1,3,7,10}</code> to define four half-open phases. The planned load is zero in phase 1, rises linearly over phase 2, remains at one in phase 3 and decreases linearly over phase 4.</p><p>Plot <code>schedule.phaseIndex</code>, <code>schedule.localTime</code>, <code>demand</code> and <code>finished</code>. At the final boundary the index and local time return to zero, the demand is zero and the schedule reports completion. This marker describes the planned sequence.</p></html>"));
end MultiphaseMission;
