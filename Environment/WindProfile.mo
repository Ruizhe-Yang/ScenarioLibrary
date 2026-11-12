within ScenarioLibrary.Environment;
block WindProfile "生成有均值和周期分量的正常外界风速"
  parameter Modelica.Units.SI.Velocity meanWind(min=0) = 3 "平均风速，m/s";
  parameter Modelica.Units.SI.Velocity modulation(min=0) = 1 "周期风速幅度，m/s";
  parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 12 "周期，s";
  parameter Modelica.Units.SI.Time phaseOrigin = 0 "从均值向上起步的相位原点，s";
  Modelica.Blocks.Interfaces.RealOutput speed(unit="m/s") "非负风速" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
initial equation
  assert(meanWind >= modulation and modulation >= 0 and period > 0, "Invalid wind profile.");
equation
  speed = meanWind+modulation*sin(2*Modelica.Constants.pi*(time-phaseOrigin)/period);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,30},{8,30},{25,43},{38,41},{44,30},{39,19},{25,18}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-62,0},{42,0},{53,10},{63,6},{65,-6},{56,-14}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-55,-30},{7,-30},{20,-42},{35,-40}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-25,70},{60,45}}, textString="v(t)", textColor={0,0,127}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="WindProfile")}),
    Documentation(info="<html><p><b>Purpose</b> 生成有均值和周期分量的正常外界风速</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput speed(unit=\"m/s\") \"非负风速\"</p><p><b>Parameters</b> parameter Modelica.Units.SI.Velocity meanWind(min=0) = 3 \"平均风速，m/s\"; parameter Modelica.Units.SI.Velocity modulation(min=0) = 1 \"周期风速幅度，m/s\"; parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 12 \"周期，s\"; parameter Modelica.Units.SI.Time phaseOrigin = 0 \"从均值向上起步的相位原点，s\"</p><p><b>Behavior</b> 生成有均值和周期分量的正常外界风速</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.EnvironmentalConditions\">ScenarioLibrary.Examples.EnvironmentalConditions</a></p>
<p>生成有均值和周期分量的正常外界风速</p>
<p>专业分类为 Environment.Atmospheric。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealOutput speed(unit=\"m/s\") \"非负风速\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>Modelica.Units.SI.Velocity meanWind(min=0) = 3 \"平均风速，m/s\"</code></li>
<li><code>Modelica.Units.SI.Velocity modulation(min=0) = 1 \"周期风速幅度，m/s\"</code></li>
<li><code>Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 12 \"周期，s\"</code></li>
<li><code>Modelica.Units.SI.Time phaseOrigin = 0 \"从均值向上起步的相位原点，s\"</code></li>
</ul>
<p><b>时序与基准行为</b> 全程连续，初相位等于 meanWind。零调制为恒定风速。</p>
<p><b>最小用法</b> 接对流或风载模型的环境速度输入。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">MultiPhaseSystemScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> 单一确定性风速模态。风向和湍流由其他物理模型定义。</p>
</html>"));
end WindProfile;
