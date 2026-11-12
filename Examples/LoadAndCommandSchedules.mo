within ScenarioLibrary.Examples;
model LoadAndCommandSchedules "Share one absolute clock across load, command and mode schedules"
  extends Modelica.Icons.Example;
  ScenarioLibrary.Operating.LoadDemand loadProfile(n=4,times={0,1,3,5},values={0,1,1,0}) annotation(Placement(transformation(origin={-96,83},extent={{-16,-16},{16,16}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput loadProfileOutput annotation(Placement(transformation(origin={153,83},extent={{-7,-7},{7,7}},rotation=0)));
  ScenarioLibrary.Operating.CommandSchedule command(n=2,times={1,5},values={true,false}) annotation(Placement(transformation(origin={-96,0},extent={{-16,-16},{16,16}},rotation=0)));
  Modelica.Blocks.Interfaces.BooleanOutput commandOutput annotation(Placement(transformation(origin={153,0},extent={{-7,-7},{7,7}},rotation=0)));
  ScenarioLibrary.Operating.ModeSchedule mode(n=3,times={0,1,5},values={0,2,0}) annotation(Placement(transformation(origin={-96,-83},extent={{-16,-16},{16,16}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput modeOutput annotation(Placement(transformation(origin={153,-83},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(loadProfile.y,loadProfileOutput) annotation(Line(points={{-80,83},{153,83}},color={0,0,127}));
  connect(command.y,commandOutput) annotation(Line(points={{-80,0},{153,0}},color={255,0,255}));
  connect(mode.y,modeOutput) annotation(Line(points={{-80,-83},{153,-83}},color={255,127,0}));
  annotation(experiment(StartTime=0,StopTime=6,Interval=0.01,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true)),
    Documentation(info="<html><p><b>Purpose</b> Share one absolute clock across load, command and mode schedules</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> The load is 0.5 at 0.5 s, 1 at 2 s and 0.5 at 4 s. The command and mode change at the table nodes.</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> loadOutput, commandOutput and modeOutput.</p></html>"));
end LoadAndCommandSchedules;
