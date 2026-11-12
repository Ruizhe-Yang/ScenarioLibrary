within ScenarioLibrary.Environment;
block ScheduledIrradiance "按正常明暗周期和过渡时长输出辐照度"
  parameter Modelica.Units.SI.Time startTime = 0 "First light transition";
  parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 120;
  parameter Modelica.Units.SI.Time lightTime(min=Modelica.Constants.small) = 75;
  parameter Modelica.Units.SI.Time transitionTime(min=Modelica.Constants.small) = 2;
  parameter Real fullIrradiance(unit="W/m2",min=0) = 1000;
  Modelica.Blocks.Interfaces.RealOutput irradiance(unit="W/m2") annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.BooleanOutput illuminated annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
protected
  Modelica.Units.SI.Time localTime;
  Real weight;
initial equation
  assert(period>0 and lightTime<=period and transitionTime>0 and 2*transitionTime<=lightTime and fullIrradiance>=0,
    "Invalid illumination schedule.");
equation
  localTime = if time >= startTime then mod(time-startTime,period) else lightTime;
  weight = min(1,max(0,min(localTime,lightTime-localTime)/transitionTime));
  irradiance = fullIrradiance*weight;
  illuminated = time >= startTime and localTime < lightTime;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-44.75,28.25},{-25.25,47.75}}, lineColor={191,0,0}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-21.35,38},{-15.5,38}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-25.348,47.652},{-21.2114,51.7886}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-35,51.65},{-35,57.5}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-44.652,47.652},{-48.7886,51.7886}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-48.65,38},{-54.5,38}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-44.652,28.348},{-48.7886,24.2114}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-35,24.35},{-35,18.5}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-25.348,28.348},{-21.2114,24.2114}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-62,-36},{-38,-36},{-22,14},{17,14},{32,-36},{62,-36}}, color={191,0,0}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{4,63},{64,36}}, textString="E(t)", textColor={191,0,0}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 按正常明暗周期和过渡时长输出辐照度</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput irradiance(unit=\"W/m2\"); Modelica.Blocks.Interfaces.BooleanOutput illuminated</p><p><b>Parameters</b> parameter Modelica.Units.SI.Time startTime = 0 \"First light transition\"; parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 120; parameter Modelica.Units.SI.Time lightTime(min=Modelica.Constants.small) = 75; parameter Modelica.Units.SI.Time transitionTime(min=Modelica.Constants.small) = 2; parameter Real fullIrradiance(unit=\"W/m2\",min=0) = 1000</p><p><b>Behavior</b> 按正常明暗周期和过渡时长输出辐照度</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.EnvironmentalConditions\">ScenarioLibrary.Examples.EnvironmentalConditions</a></p>
<p>按正常明暗周期和过渡时长输出辐照度</p>
<p><b>行为</b> 周期内先线性增亮，再平台，后线性减弱，余下为暗。起点前辐照为零。</p>
<p><b>最小用法</b> 将 irradiance 送到宿主的外部热或光电模型。</p>
<p><b>适用边界</b> 光照时长由用户直接提供，适用于地面灯源或预先生成的日照时表。</p>
<p>参数的类型、默认值和取值见下列声明。</p>
<ul>
<li><code>Modelica.Units.SI.Time startTime = 0 \"First light transition\"</code></li>
<li><code>Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 120</code></li>
<li><code>Modelica.Units.SI.Time lightTime(min=Modelica.Constants.small) = 75</code></li>
<li><code>Modelica.Units.SI.Time transitionTime(min=Modelica.Constants.small) = 2</code></li>
<li><code>Real fullIrradiance(unit=\"W/m2\",min=0) = 1000</code></li>
</ul>
<p>接口及方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealOutput irradiance(unit=\"W/m2\")</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput illuminated</code></li>
</ul>
<p><a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">MultiPhaseSystemScenario</a> 提供同域宿主参考。</p>
</html>"));
end ScheduledIrradiance;
