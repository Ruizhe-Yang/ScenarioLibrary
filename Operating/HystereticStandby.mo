within ScenarioLibrary.Operating;
block HystereticStandby "按计划需求选择运行或待机工况"
  parameter Real enterRun = 0.6 "转入运行的计划需求门限";
  parameter Real enterStandby = 0.3 "转回待机的计划需求门限";
  parameter Boolean initialRun = false "起点位于带内时选择运行";
  Modelica.Blocks.Interfaces.RealInput plannedDemand "正常外生需求" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  output ScenarioLibrary.Utilities.Types.OperatingMode mode "预定运行模式";
  Modelica.Blocks.Interfaces.BooleanOutput running "场景选择了运行工况" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
initial equation
  assert(enterStandby < enterRun, "Operating demand thresholds must be ordered.");
equation
  when {initial(),plannedDemand >= enterRun,plannedDemand <= enterStandby} then
    running = if plannedDemand >= enterRun then true elseif plannedDemand <= enterStandby then false else initialRun;
  end when;
  mode = if running then ScenarioLibrary.Utilities.Types.OperatingMode.Rated else ScenarioLibrary.Utilities.Types.OperatingMode.Standby;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-57,-28},{23,-28},{23,32},{61,32}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-57,-28},{-20,-28},{-20,32},{61,32}}, color={128,128,128}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{-10,32},{10,32}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{10,-28},{-10,-28}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="HystereticStandby")}),
    Documentation(info="<html><p><b>Purpose</b> 按计划需求选择运行或待机工况</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealInput plannedDemand \"正常外生需求\"; output ScenarioLibrary.Utilities.Types.OperatingMode mode \"预定运行模式\"; Modelica.Blocks.Interfaces.BooleanOutput running \"场景选择了运行工况\"</p><p><b>Parameters</b> parameter Real enterRun = 0.6 \"转入运行的计划需求门限\"; parameter Real enterStandby = 0.3 \"转回待机的计划需求门限\"; parameter Boolean initialRun = false \"起点位于带内时选择运行\"</p><p><b>Behavior</b> 按计划需求选择运行或待机工况</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.LoadAndCommandSchedules\">ScenarioLibrary.Examples.LoadAndCommandSchedules</a></p>
<p>按计划需求选择运行或待机工况</p>
<p>专业分类为 OperatingConditions.Standby。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealInput plannedDemand \"正常外生需求\"</code></li>
<li><code>output ScenarioLibrary.Utilities.Types.OperatingMode mode \"预定运行模式\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput running \"场景选择了运行工况\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>Real enterRun = 0.6 \"转入运行的计划需求门限\"</code></li>
<li><code>Real enterStandby = 0.3 \"转回待机的计划需求门限\"</code></li>
<li><code>Boolean initialRun = false \"起点位于带内时选择运行\"</code></li>
</ul>
<p><b>时序与基准行为</b> 包含上下切换等号。计划需求位于带内时保持原工况。</p>
<p><b>最小用法</b> 接负载任务计划的需求比例，将 mode 绑定至宿主工况入口。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">MultiPhaseSystemScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> 适用于正常需求调度。实际执行情况由宿主变量显示。</p>
</html>"));
end HystereticStandby;
