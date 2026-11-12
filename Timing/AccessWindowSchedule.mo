within ScenarioLibrary.Timing;
block AccessWindowSchedule "从多个不相交时间窗给出接入及提前准备标记"
  parameter Integer n(min=1) = 2;
  parameter Modelica.Units.SI.Time starts[n] = {2,8};
  parameter Modelica.Units.SI.Time ends[n] = {4,10};
  parameter Modelica.Units.SI.Time leadTime(min=0) = 0.5;
  Modelica.Blocks.Interfaces.IntegerOutput activeIndex "Active window index or 0" annotation(Placement(transformation(extent={{94,66},{106,78}}), iconTransformation(extent={{94,66},{106,78}})));
  Modelica.Blocks.Interfaces.BooleanOutput preparing "Within lead time of a future window" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.BooleanOutput hasNext annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
  Modelica.Blocks.Interfaces.RealOutput timeToNext(unit="s") annotation(Placement(transformation(extent={{94,-78},{106,-66}}), iconTransformation(extent={{94,-78},{106,-66}})));
protected
  Modelica.Units.SI.Time nextStart;
initial equation
  assert(n>=1 and min(ends-starts)>0 and leadTime>=0,"Invalid access windows.");
  for i in 2:n loop
    assert(starts[i]>=ends[i-1],"Access windows must be ordered and disjoint.");
  end for;
equation
  activeIndex = sum({if time>=starts[i] and time<ends[i] then i else 0 for i in 1:n});
  hasNext = time < starts[n];
  nextStart = min({if time < starts[i] then starts[i] else Modelica.Constants.inf for i in 1:n});
  timeToNext = if hasNext then nextStart-time else 0;
  preparing = activeIndex==0 and hasNext and timeToNext<=leadTime;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-66,-37},{66,-37}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Rectangle(extent={{-48,-37},{-13,24}}, lineColor={128,128,128}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{22,-37},{57,24}}, lineColor={128,128,128}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-66,-37},{-59,-37},{-59,9},{-49,9}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-13,-37},{10,-37},{10,9},{21,9}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{48,-43},{70,-64}}, textString="t", textColor={128,128,128}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 从多个不相交时间窗给出接入及提前准备标记</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.IntegerOutput activeIndex \"Active window index or 0\"; Modelica.Blocks.Interfaces.BooleanOutput preparing \"Within lead time of a future window\"; Modelica.Blocks.Interfaces.BooleanOutput hasNext; Modelica.Blocks.Interfaces.RealOutput timeToNext(unit=\"s\")</p><p><b>Parameters</b> parameter Integer n(min=1) = 2; parameter Modelica.Units.SI.Time starts[n] = {2,8}; parameter Modelica.Units.SI.Time ends[n] = {4,10}; parameter Modelica.Units.SI.Time leadTime(min=0) = 0.5</p><p><b>Behavior</b> 从多个不相交时间窗给出接入及提前准备标记</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.PhaseQualifiedWindows\">ScenarioLibrary.Examples.PhaseQualifiedWindows</a></p>
<p>从多个不相交时间窗给出接入及提前准备标记</p>
<p><b>行为</b> 各窗左闭右开。准备区只在非接入状态发出，结束后 hasNext=false。</p>
<p><b>最小用法</b> 接通用通信可见计划、实验室资源访问或多段采集计划。</p>
<p><b>适用边界</b> 时间表由使用者提供。物理通信覆盖和带宽预算由宿主决定。</p>
<p>参数的类型、默认值和取值见下列声明。</p>
<ul>
<li><code>Integer n(min=1) = 2</code></li>
<li><code>Modelica.Units.SI.Time starts[n] = {2,8}</code></li>
<li><code>Modelica.Units.SI.Time ends[n] = {4,10}</code></li>
<li><code>Modelica.Units.SI.Time leadTime(min=0) = 0.5</code></li>
</ul>
<p>接口及方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.IntegerOutput activeIndex \"Active window index or 0\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput preparing \"Within lead time of a future window\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput hasNext</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput timeToNext(unit=\"s\")</code></li>
</ul>
<p><a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">MultiPhaseSystemScenario</a> 提供同域宿主参考。</p>
</html>"));
end AccessWindowSchedule;
