within ScenarioLibrary.Operating;
block ReversibleFlowDemand "给出连续起止的正反向周期流量指令"
  parameter Modelica.Units.SI.Time startTime = 0;
  parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 2;
  parameter Integer cycles(min=1) = 2;
  parameter Modelica.Units.SI.MassFlowRate amplitude(min=0) = 0.02;
  parameter Modelica.Units.SI.MassFlowRate meanFlow = 0;
  Modelica.Blocks.Interfaces.RealOutput requestedFlow(unit="kg/s") annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.BooleanOutput running annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
initial equation
  assert(period>0 and cycles>=1 and amplitude>=0,"Invalid flow demand settings.");
equation
  running = time >= startTime and time < startTime+cycles*period;
  requestedFlow = meanFlow+(if running then amplitude*sin(2*Modelica.Constants.pi*(time-startTime)/period) else 0);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,0},{65,0}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,0},{-55.273,9.579},{-52.545,18.382},{-49.818,25.695},{-47.091,30.927},{-44.364,33.654},{-41.636,33.654},{-38.909,30.927},{-36.182,25.695},{-33.455,18.382},{-30.727,9.579},{-28,0},{-25.273,-9.579},{-22.545,-18.382},{-19.818,-25.695},{-17.091,-30.927},{-14.364,-33.654},{-11.636,-33.654},{-8.909,-30.927},{-6.182,-25.695},{-3.455,-18.382},{-0.727,-9.579},{2,0},{4.727,9.579},{7.455,18.382},{10.182,25.695},{12.909,30.927},{15.636,33.654},{18.364,33.654},{21.091,30.927},{23.818,25.695},{26.545,18.382},{29.273,9.579},{32,0},{34.727,-9.579},{37.455,-18.382},{40.182,-25.695},{42.909,-30.927},{45.636,-33.654},{48.364,-33.654},{51.091,-30.927},{53.818,-25.695},{56.545,-18.382},{59.273,-9.579},{62,0}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-45,70},{60,48}}, textString="q(t)", textColor={0,0,127}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 给出连续起止的正反向周期流量指令</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput requestedFlow(unit=\"kg/s\"); Modelica.Blocks.Interfaces.BooleanOutput running</p><p><b>Parameters</b> parameter Modelica.Units.SI.Time startTime = 0; parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 2; parameter Integer cycles(min=1) = 2; parameter Modelica.Units.SI.MassFlowRate amplitude(min=0) = 0.02; parameter Modelica.Units.SI.MassFlowRate meanFlow = 0</p><p><b>Behavior</b> 给出连续起止的正反向周期流量指令</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.LoadAndCommandSchedules\">ScenarioLibrary.Examples.LoadAndCommandSchedules</a></p>
<p>给出连续起止的正反向周期流量指令</p>
<p><b>行为</b> 在有限个整周期内围绕 meanFlow 正弦变化，窗外为平均流量。</p>
<p><b>最小用法</b> 将其接容许双向流动的供流控制。若需要逆向阶段，幅值需超过平均值绝对值。</p>
<p><b>适用边界</b> 输出是需求。允许流向和介质能量由宿主决定。</p>
<p>参数的类型、默认值和取值见下列声明。</p>
<ul>
<li><code>Modelica.Units.SI.Time startTime = 0</code></li>
<li><code>Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 2</code></li>
<li><code>Integer cycles(min=1) = 2</code></li>
<li><code>Modelica.Units.SI.MassFlowRate amplitude(min=0) = 0.02</code></li>
<li><code>Modelica.Units.SI.MassFlowRate meanFlow = 0</code></li>
</ul>
<p>接口及方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealOutput requestedFlow(unit=\"kg/s\")</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput running</code></li>
</ul>
<p><a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">FluidOperatingScenario</a> 提供同域宿主参考。</p>
</html>"));
end ReversibleFlowDemand;
