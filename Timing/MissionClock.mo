within ScenarioLibrary.Timing;
block MissionClock "生成可暂停的局部任务时间与完成标记"
  parameter Modelica.Units.SI.Time startTime = 0 "允许计时的最早时刻，s";
  parameter Modelica.Units.SI.Time duration(min=Modelica.Constants.small) = 8 "任务时长，s";
  parameter Real speed(min=Modelica.Constants.small) = 1 "任务秒对仿真秒的速率比";
  Modelica.Blocks.Interfaces.BooleanInput enable "正常计划的计时许可" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Interfaces.RealOutput elapsed(unit="s") "任务时钟" annotation(Placement(transformation(extent={{94,42},{106,54}}), iconTransformation(extent={{94,42},{106,54}})));
  Modelica.Blocks.Interfaces.BooleanOutput running "处于任务计时" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
  Modelica.Blocks.Interfaces.BooleanOutput completed "任务时钟已到终点" annotation(Placement(transformation(extent={{94,-54},{106,-42}}), iconTransformation(extent={{94,-54},{106,-42}})));
protected
  Modelica.Units.SI.Time accumulated(start=0,fixed=true);
initial equation
  assert(duration > 0 and speed > 0, "Mission clock duration and speed must be positive.");
equation
  der(accumulated) = if time >= startTime and enable then speed else 0;
  elapsed = min(duration,max(0,accumulated));
  completed = accumulated >= duration;
  running = enable and time >= startTime and not completed;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-43,-35},{43,51}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{0,43},{0,49}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,8},{0,34},{0,8}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,8},{23,-5}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Rectangle(extent={{42,-59},{49,-30}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{57,-59},{64,-30}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="MissionClock")}),
    Documentation(info="<html><p><b>Purpose</b> 生成可暂停的局部任务时间与完成标记</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.BooleanInput enable \"正常计划的计时许可\"; Modelica.Blocks.Interfaces.RealOutput elapsed(unit=\"s\") \"任务时钟\"; Modelica.Blocks.Interfaces.BooleanOutput running \"处于任务计时\"; Modelica.Blocks.Interfaces.BooleanOutput completed \"任务时钟已到终点\"</p><p><b>Parameters</b> parameter Modelica.Units.SI.Time startTime = 0 \"允许计时的最早时刻，s\"; parameter Modelica.Units.SI.Time duration(min=Modelica.Constants.small) = 8 \"任务时长，s\"; parameter Real speed(min=Modelica.Constants.small) = 1 \"任务秒对仿真秒的速率比\"</p><p><b>Behavior</b> 生成可暂停的局部任务时间与完成标记</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.PhaseQualifiedWindows\">ScenarioLibrary.Examples.PhaseQualifiedWindows</a></p>
<p>生成可暂停的局部任务时间与完成标记</p>
<p>专业分类为 TimelineAndScheduling.MissionClock。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.BooleanInput enable \"正常计划的计时许可\"</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput elapsed(unit=\"s\") \"任务时钟\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput running \"处于任务计时\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput completed \"任务时钟已到终点\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>Modelica.Units.SI.Time startTime = 0 \"允许计时的最早时刻，s\"</code></li>
<li><code>Modelica.Units.SI.Time duration(min=Modelica.Constants.small) = 8 \"任务时长，s\"</code></li>
<li><code>Real speed(min=Modelica.Constants.small) = 1 \"任务秒对仿真秒的速率比\"</code></li>
</ul>
<p><b>时序与基准行为</b> 未许可时暂停，恢复后从暂停点继续。elapsed 在终点封顶。</p>
<p><b>最小用法</b> 接任务暂停/恢复时表，把 elapsed 接到需要显式局部时间的宿主逻辑。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">MultiPhaseSystemScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> 内部累计由仿真实际起点开始。用于时间重参数化，物理状态依旧按仿真时间演化。</p>
</html>"));
end MissionClock;
