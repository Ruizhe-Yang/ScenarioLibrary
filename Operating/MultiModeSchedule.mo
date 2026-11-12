within ScenarioLibrary.Operating;
block MultiModeSchedule "由阶段统一选择工况枚举和外生负载比例"
  parameter Integer n(min=1) = 4 "工况段数";
  parameter Modelica.Units.SI.Time startTime = 0 "首段起点，s";
  parameter Modelica.Units.SI.Time durations[n](each min=Modelica.Constants.small) = fill(2,n) "各段时长，s";
  parameter ScenarioLibrary.Utilities.Types.OperatingMode modes[n] = {ScenarioLibrary.Utilities.Types.OperatingMode.Startup,ScenarioLibrary.Utilities.Types.OperatingMode.Rated,ScenarioLibrary.Utilities.Types.OperatingMode.PartLoad,ScenarioLibrary.Utilities.Types.OperatingMode.Shutdown} "各阶段模式";
  parameter Real loadFraction[n](each min=0,each max=1) = {0.3,1,0.6,0} "各阶段命令比例";
  Modelica.Blocks.Interfaces.IntegerOutput phase "当前任务阶段索引" annotation(Placement(transformation(extent={{94,42},{106,54}}), iconTransformation(extent={{94,42},{106,54}})));
  Modelica.Blocks.Interfaces.RealOutput demand "当前任务比例" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
  Modelica.Blocks.Interfaces.BooleanOutput completed "时间表已完成" annotation(Placement(transformation(extent={{94,-54},{106,-42}}), iconTransformation(extent={{94,-54},{106,-42}})));
  output ScenarioLibrary.Utilities.Types.OperatingMode mode "当前场景工况";
protected
  ScenarioLibrary.Timing.PhaseScheduler scheduler(n=n,startTime=startTime,durations=durations);
initial equation
  assert(min(loadFraction) >= 0 and max(loadFraction) <= 1, "Mode fractions must be in [0,1].");
equation
  phase = scheduler.phase;
  completed = scheduler.completed;
  mode = if phase > 0 then modes[phase] elseif completed then ScenarioLibrary.Utilities.Types.OperatingMode.Off else ScenarioLibrary.Utilities.Types.OperatingMode.Standby;
  demand = if phase > 0 then loadFraction[phase] else 0;
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
        Line(points={{-60,45},{-24,45},{-24,65},{18,65},{18,45},{60,45}}, color={0,0,127}, thickness=1.1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="MultiModeSchedule")}),
    Documentation(info="<html><p><b>Purpose</b> 由阶段统一选择工况枚举和外生负载比例</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.IntegerOutput phase \"当前任务阶段索引\"; Modelica.Blocks.Interfaces.RealOutput demand \"当前任务比例\"; Modelica.Blocks.Interfaces.BooleanOutput completed \"时间表已完成\"; output ScenarioLibrary.Utilities.Types.OperatingMode mode \"当前场景工况\"</p><p><b>Parameters</b> parameter Integer n(min=1) = 4 \"工况段数\"; parameter Modelica.Units.SI.Time startTime = 0 \"首段起点，s\"; parameter Modelica.Units.SI.Time durations[n](each min=Modelica.Constants.small) = fill(2,n) \"各段时长，s\"; parameter ScenarioLibrary.Utilities.Types.OperatingMode modes[n] = {ScenarioLibrary.Utilities.Types.OperatingMode.Startup,ScenarioLibrary.Utilities.Types.OperatingMode.Rated,ScenarioLibrary.Utilities.Types.OperatingMode.PartLoad,ScenarioLibrary.Utilities.Types.OperatingMode.Shutdown} \"各阶段模式\"; parameter Real loadFraction[n](each min=0,each max=1) = {0.3,1,0.6,0} \"各阶段命令比例\"</p><p><b>Behavior</b> 由阶段统一选择工况枚举和外生负载比例</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.LoadAndCommandSchedules\">ScenarioLibrary.Examples.LoadAndCommandSchedules</a></p>
<p>由阶段统一选择工况枚举和外生负载比例</p>
<p>专业分类为 OperatingConditions.Mode。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.IntegerOutput phase \"当前任务阶段索引\"</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput demand \"当前任务比例\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput completed \"时间表已完成\"</code></li>
<li><code>output ScenarioLibrary.Utilities.Types.OperatingMode mode \"当前场景工况\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>Integer n(min=1) = 4 \"工况段数\"</code></li>
<li><code>Modelica.Units.SI.Time startTime = 0 \"首段起点，s\"</code></li>
<li><code>Modelica.Units.SI.Time durations[n](each min=Modelica.Constants.small) = fill(2,n) \"各段时长，s\"</code></li>
<li><code>ScenarioLibrary.Utilities.Types.OperatingMode modes[n] = {ScenarioLibrary.Utilities.Types.OperatingMode.Startup,ScenarioLibrary.Utilities.Types.OperatingMode.Rated,ScenarioLibrary.Utilities.Types.OperatingMode.PartLoad,ScenarioLibrary.Utilities.Types.OperatingMode.Shutdown} \"各阶段模式\"</code></li>
<li><code>Real loadFraction[n](each min=0,each max=1) = {0.3,1,0.6,0} \"各阶段命令比例\"</code></li>
</ul>
<p><b>时序与基准行为</b> 阶段边界同时切换模式和负载比例。起点前待机，最后阶段后 Off。</p>
<p><b>最小用法</b> 在共用任务时间表中同步驱动多个外部需求。模式数组和比例数组须与 n 匹配。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">MultiPhaseSystemScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> 指令是计划值，段间可跳变，宿主应按自身动力学跟踪。</p>
</html>"));
end MultiModeSchedule;
