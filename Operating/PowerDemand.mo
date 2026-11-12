within ScenarioLibrary.Operating;
block PowerDemand "组合基础功率与多路独立任务负载"
  parameter Integer n(min=1) = 2 "任务通道数";
  parameter Modelica.Units.SI.Power basePower(min=0) = 10 "基础功率，W";
  parameter Modelica.Units.SI.Power ratings[n](each min=0) = fill(20,n) "各任务的额定功率，W";
  Modelica.Blocks.Interfaces.RealInput fraction[n](each min=0,each max=1) "各任务的计划需求比例" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Interfaces.RealOutput power(unit="W") "总计划功率" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
initial equation
  assert(n >= 1 and basePower >= 0 and min(ratings) >= 0, "Power ratings must be nonnegative.");
equation
  for i in 1:n loop
    assert(noEvent(fraction[i] >= -1e-9 and fraction[i] <= 1+1e-9), "Power demand fraction outside [0,1].");
  end for;
  power = basePower+sum({ratings[i]*min(1,max(0,fraction[i])) for i in 1:n});
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-24,-24},{24,24}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-20,-20},{20,20}}, textString="+", textColor={0,0,127}, fontSize=0),
        Line(points={{24,0},{66,0}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{-66,-45},{-42,-45},{-24,0}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-66,0},{-42,0},{-24,0}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-66,45},{-42,45},{-24,0}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{25,53},{66,18}}, textString="P", textColor={0,0,127}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="PowerDemand")}),
    Documentation(info="<html><p><b>Purpose</b> 组合基础功率与多路独立任务负载</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealInput fraction[n](each min=0,each max=1) \"各任务的计划需求比例\"; Modelica.Blocks.Interfaces.RealOutput power(unit=\"W\") \"总计划功率\"</p><p><b>Parameters</b> parameter Integer n(min=1) = 2 \"任务通道数\"; parameter Modelica.Units.SI.Power basePower(min=0) = 10 \"基础功率，W\"; parameter Modelica.Units.SI.Power ratings[n](each min=0) = fill(20,n) \"各任务的额定功率，W\"</p><p><b>Behavior</b> 组合基础功率与多路独立任务负载</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.LoadAndCommandSchedules\">ScenarioLibrary.Examples.LoadAndCommandSchedules</a></p>
<p>组合基础功率与多路独立任务负载</p>
<p>专业分类为 ExternalInputs.Power。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealInput fraction[n](each min=0,each max=1) \"各任务的计划需求比例\"</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput power(unit=\"W\") \"总计划功率\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>Integer n(min=1) = 2 \"任务通道数\"</code></li>
<li><code>Modelica.Units.SI.Power basePower(min=0) = 10 \"基础功率，W\"</code></li>
<li><code>Modelica.Units.SI.Power ratings[n](each min=0) = fill(20,n) \"各任务的额定功率，W\"</code></li>
</ul>
<p><b>时序与基准行为</b> 外部剖面叠加，所有比例为零时仍有基础功率。拒绝超出 [0,1] 的实质性越域，容纳浮点舍入。</p>
<p><b>最小用法</b> 各独立任务剖面分别接 fraction，再将 power 作为宿主负载参考。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">ElectricalLoadScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> 计划值随下游电路实现而变化。功率源、储能和负载约束由宿主处理。</p>
</html>"));
end PowerDemand;
