within ScenarioLibrary.Environment;
model FluidReservoir "沿统一任务剖面变化的外部介质储库"
  replaceable package Medium = Modelica.Media.Air.SimpleAir constrainedby Modelica.Media.Interfaces.PartialMedium;
  parameter Medium.AbsolutePressure standbyPressure(min=0) = 105000 "待机绝压，Pa";
  parameter Medium.AbsolutePressure ratedPressure(min=0) = 130000 "运行绝压，Pa";
  parameter Medium.Temperature standbyTemperature(min=0) = 293.15 "待机温度，K";
  parameter Medium.Temperature ratedTemperature(min=0) = 303.15 "运行温度，K";
  parameter Modelica.Units.SI.Time startTime = 1 "调度起点，s";
  parameter Modelica.Units.SI.Time startupTime(min=Modelica.Constants.small) = 2 "启动爬升时长，s";
  parameter Modelica.Units.SI.Time operatingTime(min=0) = 5 "额定平台时长，s";
  parameter Modelica.Units.SI.Time shutdownTime(min=Modelica.Constants.small) = 2 "返回待机时长，s";
  Modelica.Fluid.Interfaces.FluidPort_b port(redeclare package Medium=Medium) "储库出口，允许回流" annotation(Placement(transformation(extent={{-7,-107},{7,-93}}), iconTransformation(extent={{-7,-107},{7,-93}})));
  Modelica.Blocks.Interfaces.RealOutput pressure(unit="Pa") "实际边界压力" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.RealOutput temperature(unit="K") "供给流体温度" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
protected
  ScenarioLibrary.Profiles.StartupHoldShutdown schedule(startTime=startTime,riseTime=startupTime,holdTime=operatingTime,fallTime=shutdownTime);
  Modelica.Fluid.Sources.Boundary_pT reservoir(redeclare package Medium=Medium,nPorts=1,use_p_in=true,use_T_in=true);
  Modelica.Blocks.Sources.RealExpression pressureSchedule(y=standbyPressure+schedule.y*(ratedPressure-standbyPressure));
  Modelica.Blocks.Sources.RealExpression temperatureSchedule(y=standbyTemperature+schedule.y*(ratedTemperature-standbyTemperature));
initial equation
  assert(min(standbyPressure,ratedPressure) > 0 and min(standbyTemperature,ratedTemperature) > 0, "Reservoir boundaries must be positive.");
equation
  connect(pressureSchedule.y, pressure);
  connect(pressureSchedule.y, reservoir.p_in);
  connect(temperatureSchedule.y, temperature);
  connect(temperatureSchedule.y, reservoir.T_in);
  connect(reservoir.ports[1], port);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-46,-44},{46,48}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-46,34},{46,60}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-46,-30},{46,-30}}, color={0,0,127}, thickness=0.7, pattern=LinePattern.Solid),
        Text(extent={{-36,28},{36,-12}}, textString="p, T", textColor={0,0,127}, fontSize=0),
        Line(points={{0,-44},{0,-100}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-27,72},{-12,72},{2,85},{21,85},{35,72}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="FluidReservoir")}),
    Documentation(info="<html><p><b>Purpose</b> 沿统一任务剖面变化的外部介质储库</p><p><b>Interfaces</b> Modelica.Fluid.Interfaces.FluidPort_b port(redeclare package Medium=Medium) \"储库出口，允许回流\"; Modelica.Blocks.Interfaces.RealOutput pressure(unit=\"Pa\") \"实际边界压力\"; Modelica.Blocks.Interfaces.RealOutput temperature(unit=\"K\") \"供给流体温度\"</p><p><b>Parameters</b> replaceable package Medium = Modelica.Media.Air.SimpleAir constrainedby Modelica.Media.Interfaces.PartialMedium; parameter Medium.AbsolutePressure standbyPressure(min=0) = 105000 \"待机绝压，Pa\"; parameter Medium.AbsolutePressure ratedPressure(min=0) = 130000 \"运行绝压，Pa\"; parameter Medium.Temperature standbyTemperature(min=0) = 293.15 \"待机温度，K\"; parameter Medium.Temperature ratedTemperature(min=0) = 303.15 \"运行温度，K\"; parameter Modelica.Units.SI.Time startTime = 1 \"调度起点，s\"; parameter Modelica.Units.SI.Time startupTime(min=Modelica.Constants.small) = 2 \"启动爬升时长，s\"; parameter Modelica.Units.SI.Time operatingTime(min=0) = 5 \"额定平台时长，s\"; parameter Modelica.Units.SI.Time shutdownTime(min=Modelica.Constants.small) = 2 \"返回待机时长，s\"</p><p><b>Behavior</b> 沿统一任务剖面变化的外部介质储库</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.EnvironmentalConditions\">ScenarioLibrary.Examples.EnvironmentalConditions</a></p>
<p>沿统一任务剖面变化的外部介质储库</p>
<p>专业分类为 Environment.ExternalMedium。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Fluid.Interfaces.FluidPort_b port(redeclare package Medium=Medium) \"储库出口，允许回流\"</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput pressure(unit=\"Pa\") \"实际边界压力\"</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput temperature(unit=\"K\") \"供给流体温度\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>replaceable package Medium = Modelica.Media.Air.SimpleAir constrainedby Modelica.Media.Interfaces.PartialMedium</code></li>
<li><code>Medium.AbsolutePressure standbyPressure(min=0) = 105000 \"待机绝压，Pa\"</code></li>
<li><code>Medium.AbsolutePressure ratedPressure(min=0) = 130000 \"运行绝压，Pa\"</code></li>
<li><code>Medium.Temperature standbyTemperature(min=0) = 293.15 \"待机温度，K\"</code></li>
<li><code>Medium.Temperature ratedTemperature(min=0) = 303.15 \"运行温度，K\"</code></li>
<li><code>Modelica.Units.SI.Time startTime = 1 \"调度起点，s\"</code></li>
<li><code>Modelica.Units.SI.Time startupTime(min=Modelica.Constants.small) = 2 \"启动爬升时长，s\"</code></li>
<li><code>Modelica.Units.SI.Time operatingTime(min=0) = 5 \"额定平台时长，s\"</code></li>
<li><code>Modelica.Units.SI.Time shutdownTime(min=Modelica.Constants.small) = 2 \"返回待机时长，s\"</code></li>
</ul>
<p><b>时序与基准行为</b> 压力与供给温度同步线性变化，待机与额定均为明确边界。回流焓由宿主决定。</p>
<p><b>最小用法</b> redeclare 宿主介质，提供 inner System，port 接有压降或储能元件。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">FluidOperatingScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> 储库为理想边界，容量和介质组分沿用 MSL 默认；避免直接连接另一独立压力源。</p>
</html>"));
end FluidReservoir;
