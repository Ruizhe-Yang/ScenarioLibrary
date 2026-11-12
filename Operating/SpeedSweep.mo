within ScenarioLibrary.Operating;
block SpeedSweep "给出对数分布的正向角速度扫描"
  parameter Modelica.Units.SI.AngularVelocity startSpeed(min=Modelica.Constants.small) = 2 "初始速度，rad/s";
  parameter Modelica.Units.SI.AngularVelocity endSpeed(min=Modelica.Constants.small) = 12 "终止速度，rad/s";
  parameter Modelica.Units.SI.Time startTime = 1 "扫描起点，s";
  parameter Modelica.Units.SI.Time duration(min=Modelica.Constants.small) = 6 "扫描时长，s";
  Modelica.Blocks.Interfaces.RealOutput speed(unit="rad/s") "转速指令" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.RealOutput acceleration(unit="rad/s2") "扫描段的解析角加速度" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
protected
  final parameter Real span = log(endSpeed/startSpeed);
  Real progress;
initial equation
  assert(startSpeed > 0 and endSpeed > 0 and duration > 0, "Positive speeds and duration required.");
equation
  progress = min(1,max(0,(time-startTime)/duration));
  speed = startSpeed*exp(progress*span);
  acceleration = if time >= startTime and time < startTime+duration then speed*span/duration else 0;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-32},{-55.273,-31.581},{-52.545,-31.138},{-49.818,-30.67},{-47.091,-30.176},{-44.364,-29.654},{-41.636,-29.103},{-38.909,-28.521},{-36.182,-27.906},{-33.455,-27.257},{-30.727,-26.572},{-28,-25.848},{-25.273,-25.084},{-22.545,-24.277},{-19.818,-23.424},{-17.091,-22.524},{-14.364,-21.573},{-11.636,-20.569},{-8.909,-19.509},{-6.182,-18.389},{-3.455,-17.207},{-0.727,-15.958},{2,-14.639},{4.727,-13.247},{7.455,-11.776},{10.182,-10.223},{12.909,-8.582},{15.636,-6.85},{18.364,-5.021},{21.091,-3.089},{23.818,-1.048},{26.545,1.106},{29.273,3.382},{32,5.785},{34.727,8.322},{37.455,11.002},{40.182,13.833},{42.909,16.822},{45.636,19.978},{48.364,23.311},{51.091,26.832},{53.818,30.549},{56.545,34.475},{59.273,38.621},{62,43}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,73},{66,48}}, textString="w(t)", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="SpeedSweep")}),
    Documentation(info="<html><p><b>Purpose</b> 给出对数分布的正向角速度扫描</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput speed(unit=\"rad/s\") \"转速指令\"; Modelica.Blocks.Interfaces.RealOutput acceleration(unit=\"rad/s2\") \"扫描段的解析角加速度\"</p><p><b>Parameters</b> parameter Modelica.Units.SI.AngularVelocity startSpeed(min=Modelica.Constants.small) = 2 \"初始速度，rad/s\"; parameter Modelica.Units.SI.AngularVelocity endSpeed(min=Modelica.Constants.small) = 12 \"终止速度，rad/s\"; parameter Modelica.Units.SI.Time startTime = 1 \"扫描起点，s\"; parameter Modelica.Units.SI.Time duration(min=Modelica.Constants.small) = 6 \"扫描时长，s\"</p><p><b>Behavior</b> 给出对数分布的正向角速度扫描</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.LoadAndCommandSchedules\">ScenarioLibrary.Examples.LoadAndCommandSchedules</a></p>
<p>给出对数分布的正向角速度扫描</p>
<p>专业分类为 ExternalInputs.Velocity。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealOutput speed(unit=\"rad/s\") \"转速指令\"</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput acceleration(unit=\"rad/s2\") \"扫描段的解析角加速度\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>Modelica.Units.SI.AngularVelocity startSpeed(min=Modelica.Constants.small) = 2 \"初始速度，rad/s\"</code></li>
<li><code>Modelica.Units.SI.AngularVelocity endSpeed(min=Modelica.Constants.small) = 12 \"终止速度，rad/s\"</code></li>
<li><code>Modelica.Units.SI.Time startTime = 1 \"扫描起点，s\"</code></li>
<li><code>Modelica.Units.SI.Time duration(min=Modelica.Constants.small) = 6 \"扫描时长，s\"</code></li>
</ul>
<p><b>时序与基准行为</b> 扫描前后持有两端速度。内部等时间步产生等比例变化，支持向上或向下扫描。</p>
<p><b>最小用法</b> 用于按数量级覆盖转速的正常驱动任务。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">MultiPhaseSystemScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> 两端速度均须为正，不能扫描过零。加速度在边界可跳变。</p>
</html>"));
end SpeedSweep;
