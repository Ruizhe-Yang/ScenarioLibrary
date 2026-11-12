within ScenarioLibrary.Operating;
block DutyCycle "重复给出正常运行与休息时段"
  parameter Modelica.Units.SI.Time startTime = 0 "第一个周期起点，s";
  parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 5 "重复周期，s";
  parameter Real duty(min=0,max=1) = 0.5 "周期内运行比例";
  parameter Integer cycles(min=1) = 3 "计划执行周期数";
  Modelica.Blocks.Interfaces.BooleanOutput running "处于计划运行时段" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.BooleanOutput completed "计划周期全部结束" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
initial equation
  assert(period > 0 and duty >= 0 and duty <= 1 and cycles >= 1, "Invalid duty schedule.");
equation
  completed = time >= startTime+period*cycles;
  running = time >= startTime and not completed and mod(time-startTime,period) < duty*period;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,30},{-35,30},{-35,-30},{-15,-30},{-15,30},{8,30},{8,-30},{28,-30},{28,30},{51,30},{51,-30},{64,-30}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,73},{66,48}}, textString="D", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="DutyCycle")}),
    Documentation(info="<html><p><b>Purpose</b> 重复给出正常运行与休息时段</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.BooleanOutput running \"处于计划运行时段\"; Modelica.Blocks.Interfaces.BooleanOutput completed \"计划周期全部结束\"</p><p><b>Parameters</b> parameter Modelica.Units.SI.Time startTime = 0 \"第一个周期起点，s\"; parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 5 \"重复周期，s\"; parameter Real duty(min=0,max=1) = 0.5 \"周期内运行比例\"; parameter Integer cycles(min=1) = 3 \"计划执行周期数\"</p><p><b>Behavior</b> 重复给出正常运行与休息时段</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.LoadAndCommandSchedules\">ScenarioLibrary.Examples.LoadAndCommandSchedules</a></p>
<p>重复给出正常运行与休息时段</p>
<p>专业分类为 OperatingConditions.Duty。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput running \"处于计划运行时段\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput completed \"计划周期全部结束\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>Modelica.Units.SI.Time startTime = 0 \"第一个周期起点，s\"</code></li>
<li><code>Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 5 \"重复周期，s\"</code></li>
<li><code>Real duty(min=0,max=1) = 0.5 \"周期内运行比例\"</code></li>
<li><code>Integer cycles(min=1) = 3 \"计划执行周期数\"</code></li>
</ul>
<p><b>时序与基准行为</b> 周期首段运行，其后休息。任务完毕后停止，duty 为 0 或 1 时分别全休或全运行。</p>
<p><b>最小用法</b> 可用运行位驱动循环充能或待机任务命令。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">ElectricalLoadScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> 短周期生成较多时间事件，调度不包含执行延迟。</p>
</html>"));
end DutyCycle;
