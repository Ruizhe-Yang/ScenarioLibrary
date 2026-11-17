within ScenarioLibrary.Examples;
model LoadAndCommandSchedules "Generate real, Boolean and integer operating schedules"
  extends Modelica.Icons.Example;
  ScenarioLibrary.Operating.LoadDemand loadProfile(n=4,times={0,1,3,5},values={0,1,1,0})  "Real load trajectory on the absolute clock" annotation(Placement(transformation(origin={-96,83},extent={{-16,-16},{16,16}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput loadProfileOutput  "Planned real load" annotation(Placement(transformation(origin={153,83},extent={{-7,-7},{7,7}},rotation=0)));
  ScenarioLibrary.Operating.CommandSchedule command(n=2,times={1,5},values={true,false})  "Boolean command schedule" annotation(Placement(transformation(origin={-96,0},extent={{-16,-16},{16,16}},rotation=0)));
  Modelica.Blocks.Interfaces.BooleanOutput commandOutput  "Planned Boolean command" annotation(Placement(transformation(origin={153,0},extent={{-7,-7},{7,7}},rotation=0)));
  ScenarioLibrary.Operating.ModeSchedule mode(n=3,times={0,1,5},values={0,2,0})  "Integer mode schedule" annotation(Placement(transformation(origin={-96,-83},extent={{-16,-16},{16,16}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput modeOutput  "Planned integer mode" annotation(Placement(transformation(origin={153,-83},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(loadProfile.y,loadProfileOutput) annotation(Line(points={{-80,83},{153,83}},color={0,0,127}));
  connect(command.y,commandOutput) annotation(Line(points={{-80,0},{153,0}},color={255,0,255}));
  connect(mode.y,modeOutput) annotation(Line(points={{-80,-83},{153,-83}},color={255,127,0}));
  annotation(experiment(StartTime=0,StopTime=6,Interval=0.01,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true)),
    Documentation(info="<html><p>Use absolute simulation time for three independent schedules. The real load has nodes <code>{0,1,3,5}</code> and values <code>{0,1,1,0}</code>. The Boolean command becomes true at 1 s and false at 5 s; the integer mode changes from zero to two and back at those boundaries.</p><p>Plot <code>loadProfileOutput</code>, <code>commandOutput</code> and <code>modeOutput</code>. The source blocks retain their own interpolation and endpoint rules while sharing the same time reference.</p></html>"));
end LoadAndCommandSchedules;
