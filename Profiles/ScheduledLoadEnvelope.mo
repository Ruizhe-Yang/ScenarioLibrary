within ScenarioLibrary.Profiles;
block ScheduledLoadEnvelope "正常试验扫频负载及平滑包络"
  parameter Modelica.Units.SI.Time startTime = 1;
  parameter Modelica.Units.SI.Time duration(min=Modelica.Constants.small) = 5;
  parameter Modelica.Units.SI.Time edgeTime(min=Modelica.Constants.small) = 0.5;
  parameter Modelica.Units.SI.Frequency lowFrequency(min=0) = 1;
  parameter Modelica.Units.SI.Frequency highFrequency(min=0) = 5;
  parameter Real meanLoad = 0;
  parameter Real amplitude(min=0) = 1;
  Modelica.Blocks.Interfaces.RealOutput load "Plan value in the user-specified unit" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
protected
  Modelica.Units.SI.Time t;
  Real edge;
  Real phase;
initial equation
  assert(duration>0 and edgeTime>0 and 2*edgeTime<=duration and highFrequency>=lowFrequency and lowFrequency>=0 and amplitude>=0,
    "Invalid load sweep.");
equation
  t = min(duration,max(0,time-startTime));
  edge = min(1,min(t,duration-t)/edgeTime);
  phase = 2*Modelica.Constants.pi*(lowFrequency*t+0.5*(highFrequency-lowFrequency)*t^2/duration);
  load = meanLoad+amplitude*edge*sin(phase);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,3},{-34,40},{38,40},{62,3}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Line(points={{-58,3},{-34,-34},{38,-34},{62,3}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Line(points={{-58,3},{-56.723,3.175},{-55.447,3.714},{-54.17,4.631},{-52.894,5.933},{-51.617,7.612},{-50.34,9.65},{-49.064,12.009},{-47.787,14.636},{-46.511,17.458},{-45.234,20.379},{-43.957,23.285},{-42.681,26.043},{-41.404,28.502},{-40.128,30.497},{-38.851,31.857},{-37.574,32.408},{-36.298,31.986},{-35.021,30.446},{-33.745,27.41},{-32.468,22.352},{-31.191,16.587},{-29.915,10.256},{-28.638,3.537},{-27.362,-3.356},{-26.085,-10.175},{-24.809,-16.647},{-23.532,-22.483},{-22.255,-27.394},{-20.979,-31.103},{-19.702,-33.365},{-18.426,-33.982},{-17.149,-32.825},{-15.872,-29.848},{-14.596,-25.105},{-13.319,-18.757},{-12.043,-11.075},{-10.766,-2.442},{-9.489,6.667},{-8.213,15.702},{-6.936,24.07},{-5.66,31.173},{-4.383,36.455},{-3.106,39.447},{-1.83,39.817},{-0.553,37.413},{0.723,32.293},{2,24.748},{3.277,15.296},{4.553,4.662},{5.83,-6.267},{7.106,-16.513},{8.383,-25.091},{9.66,-31.111},{10.936,-33.874},{12.213,-32.968},{13.489,-28.339},{14.766,-20.333},{16.043,-9.692},{17.319,2.495},{18.596,14.888},{19.872,26.038},{21.149,34.555},{22.426,39.293},{23.702,39.516},{24.979,35.034},{26.255,26.276},{27.532,14.278},{28.809,0.592},{30.085,-12.903},{31.362,-24.246},{32.638,-31.688},{33.915,-33.975},{35.191,-30.589},{36.468,-21.881},{37.745,-9.087},{39.021,5.698},{40.298,18.732},{41.574,27.804},{42.851,31.662},{44.128,30.087},{45.404,23.904},{46.681,14.769},{47.957,4.79},{49.234,-3.94},{50.511,-9.802},{51.787,-11.988},{53.064,-10.633},{54.34,-6.714},{55.617,-1.73},{56.894,2.743},{58.17,5.516},{59.447,6.126},{60.723,4.939},{62,3}}, color={0,0,127}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 正常试验扫频负载及平滑包络</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput load \"Plan value in the user-specified unit\"</p><p><b>Parameters</b> parameter Modelica.Units.SI.Time startTime = 1; parameter Modelica.Units.SI.Time duration(min=Modelica.Constants.small) = 5; parameter Modelica.Units.SI.Time edgeTime(min=Modelica.Constants.small) = 0.5; parameter Modelica.Units.SI.Frequency lowFrequency(min=0) = 1; parameter Modelica.Units.SI.Frequency highFrequency(min=0) = 5; parameter Real meanLoad = 0; parameter Real amplitude(min=0) = 1</p><p><b>Behavior</b> 正常试验扫频负载及平滑包络</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">ScenarioLibrary.Examples.MultiphaseMission</a></p>
<p>正常试验扫频负载及平滑包络</p>
<p><b>行为</b> 正常激励从低频扫描至高频，启停包络将附加负载连续收零。</p>
<p><b>最小用法</b> 接台架计划载荷或试验环境边界的信号端。</p>
<p><b>适用边界</b> 最高频率与边沿须可由仿真设置解析。该模型表示预定试验。</p>
<p>参数的类型、默认值和取值见下列声明。</p>
<ul>
<li><code>Modelica.Units.SI.Time startTime = 1</code></li>
<li><code>Modelica.Units.SI.Time duration(min=Modelica.Constants.small) = 5</code></li>
<li><code>Modelica.Units.SI.Time edgeTime(min=Modelica.Constants.small) = 0.5</code></li>
<li><code>Modelica.Units.SI.Frequency lowFrequency(min=0) = 1</code></li>
<li><code>Modelica.Units.SI.Frequency highFrequency(min=0) = 5</code></li>
<li><code>Real meanLoad = 0</code></li>
<li><code>Real amplitude(min=0) = 1</code></li>
</ul>
<p>接口及方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealOutput load \"Plan value in the user-specified unit\"</code></li>
</ul>
<p><a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">MechanicalMissionScenario</a> 提供同域宿主参考。</p>
</html>"));
end ScheduledLoadEnvelope;
