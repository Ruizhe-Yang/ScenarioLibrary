within ScenarioLibrary.Timing;
block PhaseScheduler "按阶段持续时间组织一次任务的连续时间轴"
  parameter Integer n(min=1) = 3 "阶段数量";
  parameter Modelica.Units.SI.Time startTime = 0 "任务起点，s";
  parameter Modelica.Units.SI.Time durations[n](each min=Modelica.Constants.small) = fill(2,n) "各阶段长度，s";
  Modelica.Blocks.Interfaces.IntegerOutput phase "运行中的阶段索引 1..n；未开始或已完成时为 0" annotation(Placement(transformation(extent={{94,66},{106,78}}), iconTransformation(extent={{94,66},{106,78}})));
  Modelica.Blocks.Interfaces.BooleanOutput completed "最后阶段已结束" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.RealOutput elapsed(unit="s") "本阶段已运行时长，阶段外为零" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
  Modelica.Blocks.Interfaces.RealOutput remaining(unit="s") "本阶段剩余时长，阶段外为零" annotation(Placement(transformation(extent={{94,-78},{106,-66}}), iconTransformation(extent={{94,-78},{106,-66}})));
protected
  final parameter Modelica.Units.SI.Time ends[n] = {startTime+sum(durations[1:i]) for i in 1:n};
  Integer passed;
initial equation
  assert(n >= 1 and min(durations) > 0, "All mission phases must have positive duration.");
equation
  passed = sum({if time >= ends[i] then 1 else 0 for i in 1:n});
  completed = passed == n;
  phase = if time < startTime or completed then 0 else passed+1;
  elapsed = if phase == 0 then 0 elseif phase == 1 then time-startTime else time-ends[phase-1];
  remaining = if phase > 0 then ends[phase]-time else 0;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-67,-30},{67,-30}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Rectangle(extent={{-60,-26},{-28,26}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-16,-26},{16,26}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{28,-26},{60,26}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Text(extent={{-60,-23},{-28,23}}, textString="1", textColor={0,0,127}, fontSize=0),
        Text(extent={{-16,-23},{16,23}}, textString="2", textColor={0,0,127}, fontSize=0),
        Text(extent={{28,-23},{60,23}}, textString="3", textColor={0,0,127}, fontSize=0),
        Line(points={{-60,50},{60,50}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="PhaseScheduler")}),
    Documentation(info="<html><p><b>Purpose</b> 按阶段持续时间组织一次任务的连续时间轴</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.IntegerOutput phase \"运行中的阶段索引 1..n；未开始或已完成时为 0\"; Modelica.Blocks.Interfaces.BooleanOutput completed \"最后阶段已结束\"; Modelica.Blocks.Interfaces.RealOutput elapsed(unit=\"s\") \"本阶段已运行时长，阶段外为零\"; Modelica.Blocks.Interfaces.RealOutput remaining(unit=\"s\") \"本阶段剩余时长，阶段外为零\"</p><p><b>Parameters</b> parameter Integer n(min=1) = 3 \"阶段数量\"; parameter Modelica.Units.SI.Time startTime = 0 \"任务起点，s\"; parameter Modelica.Units.SI.Time durations[n](each min=Modelica.Constants.small) = fill(2,n) \"各阶段长度，s\"</p><p><b>Behavior</b> 按阶段持续时间组织一次任务的连续时间轴</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.PhaseQualifiedWindows\">ScenarioLibrary.Examples.PhaseQualifiedWindows</a></p>
<p>按阶段持续时间组织一次任务的连续时间轴</p>
<p>专业分类为 TimelineAndScheduling.Phase。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.IntegerOutput phase \"运行中的阶段索引 1..n；未开始或已完成时为 0\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput completed \"最后阶段已结束\"</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput elapsed(unit=\"s\") \"本阶段已运行时长，阶段外为零\"</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput remaining(unit=\"s\") \"本阶段剩余时长，阶段外为零\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>Integer n(min=1) = 3 \"阶段数量\"</code></li>
<li><code>Modelica.Units.SI.Time startTime = 0 \"任务起点，s\"</code></li>
<li><code>Modelica.Units.SI.Time durations[n](each min=Modelica.Constants.small) = fill(2,n) \"各阶段长度，s\"</code></li>
</ul>
<p><b>时序与基准行为</b> 阶段左闭右开，恰好到段尾即进入下一段。完成后 phase 回到 0，completed 保持真。</p>
<p><b>最小用法</b> 用 durations={2,4,1} 安排预备、运行和收尾，接 phase 与宿主任务曲线。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">MultiPhaseSystemScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> 阶段由确定时间表驱动。禁止零时长导致跳过索引。</p>
</html>"));
end PhaseScheduler;
