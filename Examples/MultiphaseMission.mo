within ScenarioLibrary.Examples;
model MultiphaseMission "Drive a planned load from four half-open phases"
  extends Modelica.Icons.Example;
  ScenarioLibrary.Timing.PhaseSchedule schedule(n=4,boundaries={0,1,3,7,10},phaseIds={1,2,3,4}) annotation(Placement(transformation(origin={-140,25},extent={{-15,-15},{15,15}},rotation=0)));
  ScenarioLibrary.Utilities.Views.PhaseLoad profile annotation(Placement(transformation(origin={20,20},extent={{-17,-17},{17,17}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput demand annotation(Placement(transformation(origin={165,20},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.BooleanOutput finished annotation(Placement(transformation(origin={165,-75},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(schedule.phaseIndex,profile.phaseIndex) annotation(Line(points={{-125,35.5},{-61,35.5},{-61,31.9},{3,31.9}},color={255,127,0}));
  connect(schedule.localTime,profile.localTime) annotation(Line(points={{-125,21.50001},{-120,21.50001},{-120,8.1},{3,8.1}},color={0,0,127}));
  connect(profile.demand,demand) annotation(Line(points={{37,20},{165,20}},color={0,0,127}));
  connect(schedule.completed,finished) annotation(Line(points={{-125,14.5},{-119,14.5},{-119,-75},{165,-75}},color={255,0,255}));
  annotation(experiment(StartTime=0,StopTime=10,Interval=0.01,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true),graphics={Text(extent={{-150,119},{150,105}},textString="Prepare, load, hold and unload",textColor={34,61,73})}),
    Documentation(info="<html><p><b>Purpose</b> Drive a planned load from four half-open phases</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> At 1 and 3 s the next phase starts. At 10 s the phase index is zero and the schedule is complete.</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> schedule.phaseIndex, schedule.localTime, finished and demand.</p></html>"));
end MultiphaseMission;
