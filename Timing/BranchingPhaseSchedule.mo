within ScenarioLibrary.Timing;
block BranchingPhaseSchedule "在指定阶段边界读取一次计划跳转"
  parameter Integer n(min=3) = 4;
  parameter Modelica.Units.SI.Time startTime = 0;
  parameter Modelica.Units.SI.Time durations[n](each min=Modelica.Constants.small) = fill(2,n);
  parameter Integer branchFrom(min=1,max=n-2) = 2;
  parameter Integer branchTo(min=branchFrom+2,max=n) = 4;
  Modelica.Blocks.Interfaces.BooleanInput jumpRequested "Read at the selected boundary" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Interfaces.IntegerOutput phase "Scheduled stage, 0 outside active mission" annotation(Placement(transformation(extent={{94,66},{106,78}}), iconTransformation(extent={{94,66},{106,78}})));
  Modelica.Blocks.Interfaces.BooleanOutput jumped(start=false,fixed=true) annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.BooleanOutput completed annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
  Modelica.Blocks.Interfaces.RealOutput elapsed(unit="s") "Elapsed time within stage" annotation(Placement(transformation(extent={{94,-78},{106,-66}}), iconTransformation(extent={{94,-78},{106,-66}})));
protected
  final parameter Modelica.Units.SI.Time ends[n] = {startTime+sum(durations[1:i]) for i in 1:n};
  final parameter Modelica.Units.SI.Time skipDuration = sum(durations[branchFrom+1:branchTo-1]);
  Modelica.Units.SI.Time effectiveTime;
  Integer passed;
initial equation
  assert(n>=3 and min(durations)>0 and branchFrom>=1 and branchTo>=branchFrom+2 and branchTo<=n,"Invalid branch schedule.");
equation
  when {initial(),time>=ends[branchFrom]} then
    jumped = time>=ends[branchFrom] and jumpRequested;
  end when;
  effectiveTime = time+(if jumped then skipDuration else 0);
  passed = sum({if effectiveTime>=ends[i] then 1 else 0 for i in 1:n});
  completed = passed==n;
  phase = if time<startTime or completed then 0 else passed+1;
  elapsed = if phase==0 then 0 elseif phase==1 then effectiveTime-startTime else effectiveTime-ends[phase-1];
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-67,-37},{67,-37}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Rectangle(extent={{-60,-33},{-28,19}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-16,-33},{16,19}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{28,-33},{60,19}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Text(extent={{-60,-30},{-28,16}}, textString="1", textColor={0,0,127}, fontSize=0),
        Text(extent={{-16,-30},{16,16}}, textString="2", textColor={0,0,127}, fontSize=0),
        Text(extent={{28,-30},{60,16}}, textString="3", textColor={0,0,127}, fontSize=0),
        Line(points={{-44,27},{-44,63},{44,63},{44,27}}, color={0,0,127}, thickness=1, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 在指定阶段边界读取一次计划跳转</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.BooleanInput jumpRequested \"Read at the selected boundary\"; Modelica.Blocks.Interfaces.IntegerOutput phase \"Scheduled stage, 0 outside active mission\"; Modelica.Blocks.Interfaces.BooleanOutput jumped(start=false,fixed=true); Modelica.Blocks.Interfaces.BooleanOutput completed; Modelica.Blocks.Interfaces.RealOutput elapsed(unit=\"s\") \"Elapsed time within stage\"</p><p><b>Parameters</b> parameter Integer n(min=3) = 4; parameter Modelica.Units.SI.Time startTime = 0; parameter Modelica.Units.SI.Time durations[n](each min=Modelica.Constants.small) = fill(2,n); parameter Integer branchFrom(min=1,max=n-2) = 2; parameter Integer branchTo(min=branchFrom+2,max=n) = 4</p><p><b>Behavior</b> 在指定阶段边界读取一次计划跳转</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.PhaseQualifiedWindows\">ScenarioLibrary.Examples.PhaseQualifiedWindows</a></p>
<p>在指定阶段边界读取一次计划跳转</p>
<p><b>行为</b> 仅在 branchFrom 末端读取跳转标志。真时跳过中间阶段，后续物理时长维持原定义。</p>
<p><b>最小用法</b> 例如 n=4、branchFrom=2、branchTo=4 时可选择跳过第 3 段。</p>
<p><b>适用边界</b> 只允许一次向前计划分支。控制安全判定不由此块提供。</p>
<p>参数的类型、默认值和取值见下列声明。</p>
<ul>
<li><code>Integer n(min=3) = 4</code></li>
<li><code>Modelica.Units.SI.Time startTime = 0</code></li>
<li><code>Modelica.Units.SI.Time durations[n](each min=Modelica.Constants.small) = fill(2,n)</code></li>
<li><code>Integer branchFrom(min=1,max=n-2) = 2</code></li>
<li><code>Integer branchTo(min=branchFrom+2,max=n) = 4</code></li>
</ul>
<p>接口及方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.BooleanInput jumpRequested \"Read at the selected boundary\"</code></li>
<li><code>Modelica.Blocks.Interfaces.IntegerOutput phase \"Scheduled stage, 0 outside active mission\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput jumped(start=false,fixed=true)</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput completed</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput elapsed(unit=\"s\") \"Elapsed time within stage\"</code></li>
</ul>
<p><a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">MultiPhaseSystemScenario</a> 提供同域宿主参考。</p>
</html>"));
end BranchingPhaseSchedule;
