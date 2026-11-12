within ScenarioLibrary.Examples;
model ReusableScenario "Fan out one scenario to independent first-order hosts"
  extends Modelica.Icons.Example;
  ScenarioLibrary.Profiles.Ramp scenario(height=1,startTime=0.5,duration=1.5) annotation(Placement(transformation(origin={-155,0},extent={{-16,-16},{16,16}},rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder fast(T=0.2,y_start=0,initType=Modelica.Blocks.Types.Init.InitialState) annotation(Placement(transformation(origin={5,55},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput fastResponse annotation(Placement(transformation(origin={150,55},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder slow(T=0.5,y_start=0,initType=Modelica.Blocks.Types.Init.InitialState) annotation(Placement(transformation(origin={5,-55},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput slowResponse annotation(Placement(transformation(origin={150,-55},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(scenario.y,fast.u) annotation(Line(points={{-139,0},{-76,0},{-76,55},{-13,55}},color={0,0,127}));
  connect(fast.y,fastResponse) annotation(Line(points={{21.5,55},{150,55}},color={0,0,127}));
  connect(scenario.y,slow.u) annotation(Line(points={{-139,0},{-76,0},{-76,-55},{-13,-55}},color={0,0,127}));
  connect(slow.y,slowResponse) annotation(Line(points={{21.5,-55},{150,-55}},color={0,0,127}));
  annotation(experiment(StartTime=0,StopTime=6,Interval=0.01,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true)),
    Documentation(info="<html><p><b>Purpose</b> Fan out one scenario to independent first-order hosts</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> Both hosts receive the same input and use zero initial state. Only the time constants differ.</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> scenario.y, fastResponse and slowResponse.</p></html>"));
end ReusableScenario;
