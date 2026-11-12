within ScenarioLibrary.Operating;
block ThermalSoakSchedule "定义停机后的外部热浸泡参考和再启动标记"
  parameter Modelica.Units.SI.Time shutdownAt = 5;
  parameter Modelica.Units.SI.Time soakDuration(min=Modelica.Constants.small) = 20;
  parameter Modelica.Units.SI.Time coolingTime(min=Modelica.Constants.small) = 12;
  parameter Modelica.Units.SI.Temperature operatingTemperature(min=0) = 350;
  parameter Modelica.Units.SI.Temperature ambientTemperature(min=0) = 293.15;
  Modelica.Blocks.Interfaces.RealOutput temperature(unit="K") "Prescribed thermal reference" annotation(Placement(transformation(extent={{94,42},{106,54}}), iconTransformation(extent={{94,42},{106,54}})));
  Modelica.Blocks.Interfaces.BooleanOutput soaking annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
  Modelica.Blocks.Interfaces.BooleanOutput restartDue "Scheduled restart time has passed" annotation(Placement(transformation(extent={{94,-54},{106,-42}}), iconTransformation(extent={{94,-54},{106,-42}})));
protected
  Modelica.Units.SI.Time age;
initial equation
  assert(soakDuration>0 and coolingTime>0 and min(operatingTemperature,ambientTemperature)>0,"Invalid thermal soak.");
equation
  age = max(0,time-shutdownAt);
  soaking = time >= shutdownAt and time < shutdownAt+soakDuration;
  restartDue = time >= shutdownAt+soakDuration;
  temperature = ambientTemperature+(operatingTemperature-ambientTemperature)*exp(-age/coolingTime);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,38},{-55.273,33.441},{-52.545,29.201},{-49.818,25.259},{-47.091,21.593},{-44.364,18.184},{-41.636,15.015},{-38.909,12.068},{-36.182,9.327},{-33.455,6.779},{-30.727,4.41},{-28,2.206},{-25.273,0.158},{-22.545,-1.747},{-19.818,-3.519},{-17.091,-5.166},{-14.364,-6.697},{-11.636,-8.122},{-8.909,-9.446},{-6.182,-10.677},{-3.455,-11.822},{-0.727,-12.887},{2,-13.877},{4.727,-14.797},{7.455,-15.653},{10.182,-16.449},{12.909,-17.189},{15.636,-17.877},{18.364,-18.517},{21.091,-19.112},{23.818,-19.666},{26.545,-20.18},{29.273,-20.659},{32,-21.103},{34.727,-21.517},{37.455,-21.902},{40.182,-22.259},{42.909,-22.592},{45.636,-22.901},{48.364,-23.188},{51.091,-23.456},{53.818,-23.704},{56.545,-23.936},{59.273,-24.151},{62,-24.35}}, color={191,0,0}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{33,-40},{33,55}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Text(extent={{-49,70},{-22,43}}, textString="T", textColor={191,0,0}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 定义停机后的外部热浸泡参考和再启动标记</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput temperature(unit=\"K\") \"Prescribed thermal reference\"; Modelica.Blocks.Interfaces.BooleanOutput soaking; Modelica.Blocks.Interfaces.BooleanOutput restartDue \"Scheduled restart time has passed\"</p><p><b>Parameters</b> parameter Modelica.Units.SI.Time shutdownAt = 5; parameter Modelica.Units.SI.Time soakDuration(min=Modelica.Constants.small) = 20; parameter Modelica.Units.SI.Time coolingTime(min=Modelica.Constants.small) = 12; parameter Modelica.Units.SI.Temperature operatingTemperature(min=0) = 350; parameter Modelica.Units.SI.Temperature ambientTemperature(min=0) = 293.15</p><p><b>Behavior</b> 定义停机后的外部热浸泡参考和再启动标记</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.LoadAndCommandSchedules\">ScenarioLibrary.Examples.LoadAndCommandSchedules</a></p>
<p>定义停机后的外部热浸泡参考和再启动标记</p>
<p><b>行为</b> 停机前给定运行参考，停机后按已配置指数曲线给定热参考。再启动标记只由时间表决定。</p>
<p><b>最小用法</b> 温度接规定温度源，restartDue 接外部任务逻辑。</p>
<p><b>适用边界</b> 它描述外部边界参考。设备的实际冷却、残余能量和再启动许可由宿主求解。</p>
<p>参数的类型、默认值和取值见下列声明。</p>
<ul>
<li><code>Modelica.Units.SI.Time shutdownAt = 5</code></li>
<li><code>Modelica.Units.SI.Time soakDuration(min=Modelica.Constants.small) = 20</code></li>
<li><code>Modelica.Units.SI.Time coolingTime(min=Modelica.Constants.small) = 12</code></li>
<li><code>Modelica.Units.SI.Temperature operatingTemperature(min=0) = 350</code></li>
<li><code>Modelica.Units.SI.Temperature ambientTemperature(min=0) = 293.15</code></li>
</ul>
<p>接口及方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealOutput temperature(unit=\"K\") \"Prescribed thermal reference\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput soaking</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput restartDue \"Scheduled restart time has passed\"</code></li>
</ul>
<p><a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">ThermalCycleScenario</a> 提供同域宿主参考。</p>
</html>"));
end ThermalSoakSchedule;
