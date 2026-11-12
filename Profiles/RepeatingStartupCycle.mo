within ScenarioLibrary.Profiles;
block RepeatingStartupCycle "按启运、保载、停机和休息重复执行正常任务"
  parameter Integer cycles(min=1) = 3;
  parameter Modelica.Units.SI.Time startTime = 0;
  parameter Modelica.Units.SI.Time riseTime(min=Modelica.Constants.small) = 1;
  parameter Modelica.Units.SI.Time holdTime(min=0) = 2;
  parameter Modelica.Units.SI.Time fallTime(min=Modelica.Constants.small) = 1;
  parameter Modelica.Units.SI.Time idleTime(min=0) = 1;
  parameter Real standby = 0 "Off-task demand";
  parameter Real rated = 1 "Running demand";
  final parameter Modelica.Units.SI.Time period = riseTime+holdTime+fallTime+idleTime;
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(extent={{94,42},{106,54}}), iconTransformation(extent={{94,42},{106,54}})));
  Modelica.Blocks.Interfaces.IntegerOutput cycle "1-based running cycle or 0" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
  Modelica.Blocks.Interfaces.BooleanOutput completed annotation(Placement(transformation(extent={{94,-54},{106,-42}}), iconTransformation(extent={{94,-54},{106,-42}})));
protected
  Modelica.Units.SI.Time localTime;
  Real fraction;
initial equation
  assert(cycles>=1 and riseTime>0 and holdTime>=0 and fallTime>0 and idleTime>=0,"Invalid startup cycle.");
equation
  completed = time >= startTime+cycles*period;
  cycle = if time >= startTime and not completed then 1+integer(floor((time-startTime)/period)) else 0;
  localTime = if cycle>0 then time-startTime-(cycle-1)*period else 0;
  fraction = if cycle==0 then 0 elseif localTime<riseTime then localTime/riseTime
    elseif localTime<riseTime+holdTime then 1 else max(0,1-(localTime-riseTime-holdTime)/fallTime);
  y = standby+(rated-standby)*fraction;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-30},{-46,32},{-29,32},{-17,-30},{-7,-30},{5,32},{22,32},{34,-30},{64,-30}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,73},{66,48}}, textString="n cycles", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 按启运、保载、停机和休息重复执行正常任务</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput y; Modelica.Blocks.Interfaces.IntegerOutput cycle \"1-based running cycle or 0\"; Modelica.Blocks.Interfaces.BooleanOutput completed</p><p><b>Parameters</b> parameter Integer cycles(min=1) = 3; parameter Modelica.Units.SI.Time startTime = 0; parameter Modelica.Units.SI.Time riseTime(min=Modelica.Constants.small) = 1; parameter Modelica.Units.SI.Time holdTime(min=0) = 2; parameter Modelica.Units.SI.Time fallTime(min=Modelica.Constants.small) = 1; parameter Modelica.Units.SI.Time idleTime(min=0) = 1; parameter Real standby = 0 \"Off-task demand\"; parameter Real rated = 1 \"Running demand\"; final parameter Modelica.Units.SI.Time period = riseTime+holdTime+fallTime+idleTime</p><p><b>Behavior</b> 按启运、保载、停机和休息重复执行正常任务</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">ScenarioLibrary.Examples.MultiphaseMission</a></p>
<p>按启运、保载、停机和休息重复执行正常任务</p>
<p><b>行为</b> 每轮包含四段，连续回到待机值。完成后 cycle=0、completed=true。</p>
<p><b>最小用法</b> 把 y 接重复启动的负荷、供热或流量参考。</p>
<p><b>适用边界</b> 零保载和零休息均允许。起落沿需正时长。</p>
<p>参数的类型、默认值和取值见下列声明。</p>
<ul>
<li><code>Integer cycles(min=1) = 3</code></li>
<li><code>Modelica.Units.SI.Time startTime = 0</code></li>
<li><code>Modelica.Units.SI.Time riseTime(min=Modelica.Constants.small) = 1</code></li>
<li><code>Modelica.Units.SI.Time holdTime(min=0) = 2</code></li>
<li><code>Modelica.Units.SI.Time fallTime(min=Modelica.Constants.small) = 1</code></li>
<li><code>Modelica.Units.SI.Time idleTime(min=0) = 1</code></li>
<li><code>Real standby = 0 \"Off-task demand\"</code></li>
<li><code>Real rated = 1 \"Running demand\"</code></li>
<li><code>final parameter Modelica.Units.SI.Time period = riseTime+holdTime+fallTime+idleTime</code></li>
</ul>
<p>接口及方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealOutput y</code></li>
<li><code>Modelica.Blocks.Interfaces.IntegerOutput cycle \"1-based running cycle or 0\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput completed</code></li>
</ul>
<p><a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">ThermalCycleScenario</a> 提供同域宿主参考。</p>
</html>"));
end RepeatingStartupCycle;
