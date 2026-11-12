within ScenarioLibrary.Profiles;
block PeriodicLoadCycle "有限次数重复播放一个完整负载周期"
  parameter Integer n(min=2) = 3 "周期剖面节点数";
  parameter Integer cycles(min=1) = 3 "执行周期数";
  parameter Modelica.Units.SI.Time startTime = 0 "循环起点，s";
  parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 2 "重复周期，s";
  parameter Real points[n,2] = [0,0;period/2,1;period,0] "局部时刻与命令";
  parameter Real standby = 0 "循环以外的指令";
  Modelica.Blocks.Interfaces.RealOutput y "任务负载曲线" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.IntegerOutput cycle "活动周期序号从 1 起，循环外为 0" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
protected
  Boolean active;
  Modelica.Blocks.Tables.CombiTable1Ds table(table=points,columns={2},smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint);
initial equation
  assert(n >= 2 and cycles >= 1 and period > 0, "Invalid number or period of load cycles.");
  assert(abs(points[1,1]) <= 1e-12*period and abs(points[n,1]-period) <= 1e-12*period and
    min(points[2:n,1]-points[1:n-1,1]) > 0, "Cycle points must span exactly one period.");
equation
  active = time >= startTime and time < startTime+cycles*period;
  cycle = if active then 1+integer(floor((time-startTime)/period)) else 0;
  table.u = if active then mod(time-startTime,period) else 0;
  y = if active then table.y[1] else standby;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-28},{-40,35},{-22,5},{-4,-28},{14,35},{32,5},{50,-28},{64,-28}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,73},{66,48}}, textString="n cycles", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="PeriodicLoadCycle")}),
    Documentation(info="<html><p><b>Purpose</b> 有限次数重复播放一个完整负载周期</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput y \"任务负载曲线\"; Modelica.Blocks.Interfaces.IntegerOutput cycle \"活动周期序号从 1 起，循环外为 0\"</p><p><b>Parameters</b> parameter Integer n(min=2) = 3 \"周期剖面节点数\"; parameter Integer cycles(min=1) = 3 \"执行周期数\"; parameter Modelica.Units.SI.Time startTime = 0 \"循环起点，s\"; parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 2 \"重复周期，s\"; parameter Real points[n,2] = [0,0;period/2,1;period,0] \"局部时刻与命令\"; parameter Real standby = 0 \"循环以外的指令\"</p><p><b>Behavior</b> 有限次数重复播放一个完整负载周期</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">ScenarioLibrary.Examples.MultiphaseMission</a></p>
<p>有限次数重复播放一个完整负载周期</p>
<p>专业分类为 MissionProfiles.Cyclic。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealOutput y \"任务负载曲线\"</code></li>
<li><code>Modelica.Blocks.Interfaces.IntegerOutput cycle \"活动周期序号从 1 起，循环外为 0\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>Integer n(min=2) = 3 \"周期剖面节点数\"</code></li>
<li><code>Integer cycles(min=1) = 3 \"执行周期数\"</code></li>
<li><code>Modelica.Units.SI.Time startTime = 0 \"循环起点，s\"</code></li>
<li><code>Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 2 \"重复周期，s\"</code></li>
<li><code>Real points[n,2] = [0,0;period/2,1;period,0] \"局部时刻与命令\"</code></li>
<li><code>Real standby = 0 \"循环以外的指令\"</code></li>
</ul>
<p><b>时序与基准行为</b> 每周期在左端从头播放。终点后保持 standby。若首尾值不同，则重复接缝发生跃变。</p>
<p><b>最小用法</b> 接任务功率比例或负载轨迹，可观测 cycle 作为阶段标记。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">ElectricalLoadScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> period 及两端节点时刻须一致，建议与 standby 对齐以平滑启停。</p>
</html>"));
end PeriodicLoadCycle;
