within ScenarioLibrary.Profiles;
block StartupHoldShutdown "按启动、运行、停机三段给出任务需求"
  parameter Modelica.Units.SI.Time startTime = 1 "启动时刻，s";
  parameter Modelica.Units.SI.Time riseTime(min=Modelica.Constants.small) = 2 "启动爬升时间，s";
  parameter Modelica.Units.SI.Time holdTime(min=0) = 5 "稳定运行时间，s";
  parameter Modelica.Units.SI.Time fallTime(min=Modelica.Constants.small) = 2 "停机回落时间，s";
  parameter Real standby = 0 "待机值";
  parameter Real rated = 1 "运行值";
  Modelica.Blocks.Interfaces.RealOutput y "任务输出" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
protected
  Real fraction;
  Modelica.Units.SI.Time elapsed;
initial equation
  assert(riseTime > 0 and holdTime >= 0 and fallTime > 0, "Invalid startup or shutdown durations.");
equation
  elapsed = time-startTime;
  fraction = if elapsed < 0 then 0
    elseif elapsed < riseTime then elapsed/riseTime
    elseif elapsed < riseTime+holdTime then 1
    else max(0,1-(elapsed-riseTime-holdTime)/fallTime);
  y = standby+(rated-standby)*fraction;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-30},{-40,-30},{-15,36},{21,36},{45,-30},{64,-30}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="StartupHoldShutdown")}),
    Documentation(info="<html><p><b>Purpose</b> 按启动、运行、停机三段给出任务需求</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput y \"任务输出\"</p><p><b>Parameters</b> parameter Modelica.Units.SI.Time startTime = 1 \"启动时刻，s\"; parameter Modelica.Units.SI.Time riseTime(min=Modelica.Constants.small) = 2 \"启动爬升时间，s\"; parameter Modelica.Units.SI.Time holdTime(min=0) = 5 \"稳定运行时间，s\"; parameter Modelica.Units.SI.Time fallTime(min=Modelica.Constants.small) = 2 \"停机回落时间，s\"; parameter Real standby = 0 \"待机值\"; parameter Real rated = 1 \"运行值\"</p><p><b>Behavior</b> 按启动、运行、停机三段给出任务需求</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">ScenarioLibrary.Examples.MultiphaseMission</a></p>
<p>按启动、运行、停机三段给出任务需求</p>
<p>专业分类为 MissionProfiles.MultiPhase。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealOutput y \"任务输出\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>Modelica.Units.SI.Time startTime = 1 \"启动时刻，s\"</code></li>
<li><code>Modelica.Units.SI.Time riseTime(min=Modelica.Constants.small) = 2 \"启动爬升时间，s\"</code></li>
<li><code>Modelica.Units.SI.Time holdTime(min=0) = 5 \"稳定运行时间，s\"</code></li>
<li><code>Modelica.Units.SI.Time fallTime(min=Modelica.Constants.small) = 2 \"停机回落时间，s\"</code></li>
<li><code>Real standby = 0 \"待机值\"</code></li>
<li><code>Real rated = 1 \"运行值\"</code></li>
</ul>
<p><b>时序与基准行为</b> 启动和停机线性，含独立稳态段。两侧为 standby，输出值连续。</p>
<p><b>最小用法</b> 接正常供热、流量需求或加载比例。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">ThermalCycleScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> 短时间常数可能使宿主瞬态刚性增加。</p>
</html>"));
end StartupHoldShutdown;
