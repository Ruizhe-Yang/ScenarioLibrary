within ScenarioLibrary.Environment;
block AmbientTemperatureCycle "以给定峰时描述可重复的环境温度循环"
  parameter Modelica.Units.SI.Temperature minimumTemperature(min=0) = 288.15 "谷值，K";
  parameter Modelica.Units.SI.Temperature maximumTemperature(min=0) = 303.15 "峰值，K";
  parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 86400 "周期，s";
  parameter Modelica.Units.SI.Time peakTime = 50400 "任一峰值时刻，s";
  Modelica.Blocks.Interfaces.RealOutput temperature(unit="K") "环境温度" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
initial equation
  assert(minimumTemperature > 0 and maximumTemperature >= minimumTemperature and period > 0, "Invalid ambient cycle.");
equation
  temperature = 0.5*(minimumTemperature+maximumTemperature) +
    0.5*(maximumTemperature-minimumTemperature)*cos(2*Modelica.Constants.pi*(time-peakTime)/period);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-45.46,-6.7},{-34.54,29}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=4.2),
        Ellipse(extent={{-50.5,-17.2},{-29.5,3.8}}, lineColor={64,64,64}, fillColor={191,0,0}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-40,-4.6},{-40,23.54}}, color={191,0,0}, thickness=2, pattern=LinePattern.Solid),
        Line(points={{-34.12,5.9},{-29.92,5.9}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-34.12,14.3},{-29.92,14.3}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-34.12,22.7},{-29.92,22.7}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-15,33},{-13.182,32.715},{-11.364,31.866},{-9.545,30.47},{-7.727,28.555},{-5.909,26.161},{-4.091,23.336},{-2.273,20.138},{-0.455,16.632},{1.364,12.889},{3.182,8.985},{5,5},{6.818,1.015},{8.636,-2.889},{10.455,-6.632},{12.273,-10.138},{14.091,-13.336},{15.909,-16.161},{17.727,-18.555},{19.545,-20.47},{21.364,-21.866},{23.182,-22.715},{25,-23},{26.818,-22.715},{28.636,-21.866},{30.455,-20.47},{32.273,-18.555},{34.091,-16.161},{35.909,-13.336},{37.727,-10.138},{39.545,-6.632},{41.364,-2.889},{43.182,1.015},{45,5},{46.818,8.985},{48.636,12.889},{50.455,16.632},{52.273,20.138},{54.091,23.336},{55.909,26.161},{57.727,28.555},{59.545,30.47},{61.364,31.866},{63.182,32.715},{65,33}}, color={191,0,0}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="AmbientTemperatureCycle")}),
    Documentation(info="<html><p><b>Purpose</b> 以给定峰时描述可重复的环境温度循环</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput temperature(unit=\"K\") \"环境温度\"</p><p><b>Parameters</b> parameter Modelica.Units.SI.Temperature minimumTemperature(min=0) = 288.15 \"谷值，K\"; parameter Modelica.Units.SI.Temperature maximumTemperature(min=0) = 303.15 \"峰值，K\"; parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 86400 \"周期，s\"; parameter Modelica.Units.SI.Time peakTime = 50400 \"任一峰值时刻，s\"</p><p><b>Behavior</b> 以给定峰时描述可重复的环境温度循环</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.EnvironmentalConditions\">ScenarioLibrary.Examples.EnvironmentalConditions</a></p>
<p>以给定峰时描述可重复的环境温度循环</p>
<p>专业分类为 Environment.Thermal。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealOutput temperature(unit=\"K\") \"环境温度\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>Modelica.Units.SI.Temperature minimumTemperature(min=0) = 288.15 \"谷值，K\"</code></li>
<li><code>Modelica.Units.SI.Temperature maximumTemperature(min=0) = 303.15 \"峰值，K\"</code></li>
<li><code>Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 86400 \"周期，s\"</code></li>
<li><code>Modelica.Units.SI.Time peakTime = 50400 \"任一峰值时刻，s\"</code></li>
</ul>
<p><b>时序与基准行为</b> 仿真全程按周期定义，峰时等于最高温。恒温可令两极值相等。</p>
<p><b>最小用法</b> 接 PrescribedTemperature.T 或流体边界温度端。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">ThermalCycleScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> 周期模型忽略天气随机变化，气温需与实际环境数据核对。</p>
</html>"));
end AmbientTemperatureCycle;
