within ScenarioLibrary.Examples;
model EnvironmentalConditions "Inspect the standard-air model and planned environmental signals"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant seaHeight(k=0) annotation(Placement(transformation(origin={-258,160},extent={{-12,-12},{12,12}},rotation=0)));
  ScenarioLibrary.Environment.Atmosphere sea annotation(Placement(transformation(origin={-127,160},extent={{-14,-14},{14,14}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput seaPressure annotation(Placement(transformation(origin={16,160},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Sources.Constant hillHeight(k=1000) annotation(Placement(transformation(origin={-258,92},extent={{-12,-12},{12,12}},rotation=0)));
  ScenarioLibrary.Environment.Atmosphere hill annotation(Placement(transformation(origin={-127,92},extent={{-14,-14},{14,14}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput hillPressure annotation(Placement(transformation(origin={16,92},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Sources.Constant upperHeight(k=5000) annotation(Placement(transformation(origin={-258,24},extent={{-12,-12},{12,12}},rotation=0)));
  ScenarioLibrary.Environment.Atmosphere upper annotation(Placement(transformation(origin={-127,24},extent={{-14,-14},{14,14}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput upperPressure annotation(Placement(transformation(origin={16,24},extent={{-7,-7},{7,7}},rotation=0)));
  ScenarioLibrary.Environment.Temperature temperature(values={300,300}) annotation(Placement(transformation(origin={-127,-55},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput temperatureReadback annotation(Placement(transformation(origin={43,-55},extent={{-7,-7},{7,7}},rotation=0)));
  ScenarioLibrary.Environment.Pressure pressure(values={101325,101325}) annotation(Placement(transformation(origin={-127,-119},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput pressureReadback annotation(Placement(transformation(origin={43,-119},extent={{-7,-7},{7,7}},rotation=0)));
  ScenarioLibrary.Environment.Inclination grade(alpha=5*Modelica.Constants.pi/180) annotation(Placement(transformation(origin={-127,-184},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput gradeReadback annotation(Placement(transformation(origin={43,-184},extent={{-7,-7},{7,7}},rotation=0)));
  ScenarioLibrary.Environment.Wind wind(values=[2,0,0;2,0,0]) annotation(Placement(transformation(origin={90,130},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput windReadback annotation(Placement(transformation(origin={260,130},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(seaHeight.y,sea.height) annotation(Line(points={{-244.8,160},{-141,160}},color={0,0,127}));
  connect(sea.p,seaPressure) annotation(Line(points={{-113,160},{16,160}},color={0,0,127}));
  connect(hillHeight.y,hill.height) annotation(Line(points={{-244.8,92},{-141,92}},color={0,0,127}));
  connect(hill.p,hillPressure) annotation(Line(points={{-113,92},{16,92}},color={0,0,127}));
  connect(upperHeight.y,upper.height) annotation(Line(points={{-244.8,24},{-141,24}},color={0,0,127}));
  connect(upper.p,upperPressure) annotation(Line(points={{-113,24},{16,24}},color={0,0,127}));
  connect(temperature.y,temperatureReadback) annotation(Line(points={{-112,-55},{43,-55}},color={0,0,127}));
  connect(pressure.y,pressureReadback) annotation(Line(points={{-112,-119},{43,-119}},color={0,0,127}));
  connect(grade.alongSlope,gradeReadback) annotation(Line(points={{-112,-187.5},{43,-187.5},{43,-184}},color={0,0,127}));
  connect(wind.vx,windReadback) annotation(Line(points={{105,140.5},{260,140.5},{260,130}},color={0,0,127}));
  annotation(experiment(StartTime=0,StopTime=5,Interval=0.01,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-360,-240},{360,240}},preserveAspectRatio=true),graphics={Text(extent={{-282,217},{18,203}},textString="Static atmosphere at three elevations",textColor={34,61,73})}),
    Documentation(info="<html><p><b>Purpose</b> Inspect the standard-air model and planned environmental signals</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> Sea-level temperature is 288.15 K and pressure is 101325 Pa. The grade resolves gravity with the uphill axis positive.</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> sea.T, seaPressure, sea.rho, gradeReadback, windReadback, temperatureReadback.</p></html>"));
end EnvironmentalConditions;
