within ScenarioLibrary.Examples;
model ReusableScenario "Apply one planned ramp to two independent dynamic responses"
  extends Modelica.Icons.Example;
  ScenarioLibrary.Profiles.Ramp scenario(height=1,startTime=0.5,duration=1.5)  "Common planned ramp input" annotation(Placement(transformation(origin={-155,0},extent={{-16,-16},{16,16}},rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder fast(T=0.2,y_start=0,initType=Modelica.Blocks.Types.Init.InitialState)  "First-order response with the shorter time constant" annotation(Placement(transformation(origin={5,55},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput fastResponse  "Response of the faster first-order block" annotation(Placement(transformation(origin={150,55},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder slow(T=0.5,y_start=0,initType=Modelica.Blocks.Types.Init.InitialState)  "First-order response with the longer time constant" annotation(Placement(transformation(origin={5,-55},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput slowResponse  "Response of the slower first-order block" annotation(Placement(transformation(origin={150,-55},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(scenario.y,fast.u) annotation(Line(points={{-139,0},{-76,0},{-76,55},{-13,55}},color={0,0,127}));
  connect(fast.y,fastResponse) annotation(Line(points={{21.5,55},{150,55}},color={0,0,127}));
  connect(scenario.y,slow.u) annotation(Line(points={{-139,0},{-76,0},{-76,-55},{-13,-55}},color={0,0,127}));
  connect(slow.y,slowResponse) annotation(Line(points={{21.5,-55},{150,-55}},color={0,0,127}));
  annotation(experiment(StartTime=0,StopTime=6,Interval=0.01,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true)),
    Documentation(info="<html><p>Fan out one ramp to two first-order blocks with time constants of 0.2 s and 0.5 s. The input begins rising at 0.5 s, reaches one at 2 s and then holds. Both response states start at zero.</p><p>Plot <code>scenario.y</code>, <code>fastResponse</code> and <code>slowResponse</code>. The shared input defines the comparison conditions; the two dynamic blocks determine the resulting responses.</p></html>"));
end ReusableScenario;
