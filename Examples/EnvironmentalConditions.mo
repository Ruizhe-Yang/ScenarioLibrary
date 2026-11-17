within ScenarioLibrary.Examples;
model EnvironmentalConditions "Inspect atmospheric conditions and environmental signals"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant seaHeight(k=0)  "Sea-level height input" annotation(Placement(transformation(origin={-258,160},extent={{-12,-12},{12,12}},rotation=0)));
  ScenarioLibrary.Environment.Atmosphere sea  "Atmospheric relation at sea level" annotation(Placement(transformation(origin={-127,160},extent={{-14,-14},{14,14}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput seaPressure  "Pressure at sea level" annotation(Placement(transformation(origin={16,160},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Sources.Constant hillHeight(k=1000)  "Height input of 1000 m" annotation(Placement(transformation(origin={-258,92},extent={{-12,-12},{12,12}},rotation=0)));
  ScenarioLibrary.Environment.Atmosphere hill  "Atmospheric relation at 1000 m" annotation(Placement(transformation(origin={-127,92},extent={{-14,-14},{14,14}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput hillPressure  "Pressure at 1000 m" annotation(Placement(transformation(origin={16,92},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Sources.Constant upperHeight(k=5000)  "Height input of 5000 m" annotation(Placement(transformation(origin={-258,24},extent={{-12,-12},{12,12}},rotation=0)));
  ScenarioLibrary.Environment.Atmosphere upper  "Atmospheric relation at 5000 m" annotation(Placement(transformation(origin={-127,24},extent={{-14,-14},{14,14}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput upperPressure  "Pressure at 5000 m" annotation(Placement(transformation(origin={16,24},extent={{-7,-7},{7,7}},rotation=0)));
  ScenarioLibrary.Environment.Temperature temperature(values={300,300})  "Scheduled environment temperature" annotation(Placement(transformation(origin={-127,-55},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput temperatureReadback  "Scheduled temperature output" annotation(Placement(transformation(origin={43,-55},extent={{-7,-7},{7,7}},rotation=0)));
  ScenarioLibrary.Environment.Pressure pressure(values={101325,101325})  "Scheduled environment pressure" annotation(Placement(transformation(origin={-127,-119},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput pressureReadback  "Scheduled pressure output" annotation(Placement(transformation(origin={43,-119},extent={{-7,-7},{7,7}},rotation=0)));
  ScenarioLibrary.Environment.Inclination grade(alpha=5*Modelica.Constants.pi/180)  "Upward-positive slope configuration" annotation(Placement(transformation(origin={-127,-184},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput gradeReadback  "Gravity component along the upward-positive slope" annotation(Placement(transformation(origin={43,-184},extent={{-7,-7},{7,7}},rotation=0)));
  ScenarioLibrary.Environment.Wind wind(values=[2,0,0;2,0,0])  "Scheduled wind-velocity vector" annotation(Placement(transformation(origin={90,130},extent={{-15,-15},{15,15}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput windReadback  "First wind-velocity component" annotation(Placement(transformation(origin={260,130},extent={{-7,-7},{7,7}},rotation=0)));
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
    Documentation(info="<html><p>Evaluate the dry-air atmospheric relation at heights of 0, 1000 and 5000 m. Separate scheduled signals provide temperature, pressure and wind, while a 5 degree inclination generates a gravity component along the slope.</p><p>Plot the three pressure outputs and the environmental readbacks. The inclination convention gives a negative along-slope gravity component for a positive upward slope. These signal outputs require explicit connection to the receiving model.</p></html>"));
end EnvironmentalConditions;
