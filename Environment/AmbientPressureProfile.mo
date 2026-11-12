within ScenarioLibrary.Environment;
block AmbientPressureProfile "由任务海拔轨迹计算等温大气压力"
  parameter Modelica.Units.SI.AbsolutePressure seaLevelPressure(min=0) = 101325 "零海拔压力，Pa";
  parameter Modelica.Units.SI.Length scaleHeight(min=Modelica.Constants.small) = 8434 "等温尺度高度，m";
  Modelica.Blocks.Interfaces.RealInput altitude(unit="m") "任务海拔" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Interfaces.RealOutput pressure(unit="Pa") "环境绝压" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
initial equation
  assert(seaLevelPressure > 0 and scaleHeight > 0, "Positive atmosphere scales required.");
equation
  assert(noEvent(altitude >= -500 and altitude <= 6000), "Altitude outside the configured isothermal profile range.");
  pressure = seaLevelPressure*exp(-altitude/scaleHeight);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,45},{-55.273,40.753},{-52.545,36.732},{-49.818,32.924},{-47.091,29.318},{-44.364,25.904},{-41.636,22.671},{-38.909,19.61},{-36.182,16.711},{-33.455,13.966},{-30.727,11.366},{-28,8.905},{-25.273,6.574},{-22.545,4.367},{-19.818,2.278},{-17.091,0.299},{-14.364,-1.575},{-11.636,-3.35},{-8.909,-5.03},{-6.182,-6.621},{-3.455,-8.127},{-0.727,-9.554},{2,-10.904},{4.727,-12.184},{7.455,-13.395},{10.182,-14.542},{12.909,-15.628},{15.636,-16.656},{18.364,-17.63},{21.091,-18.552},{23.818,-19.425},{26.545,-20.252},{29.273,-21.035},{32,-21.776},{34.727,-22.478},{37.455,-23.143},{40.182,-23.772},{42.909,-24.368},{45.636,-24.933},{48.364,-25.467},{51.091,-25.973},{53.818,-26.452},{56.545,-26.906},{59.273,-27.336},{62,-27.743}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,73},{66,48}}, textString="p(h)", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="AmbientPressureProfile")}),
    Documentation(info="<html><p><b>Purpose</b> 由任务海拔轨迹计算等温大气压力</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealInput altitude(unit=\"m\") \"任务海拔\"; Modelica.Blocks.Interfaces.RealOutput pressure(unit=\"Pa\") \"环境绝压\"</p><p><b>Parameters</b> parameter Modelica.Units.SI.AbsolutePressure seaLevelPressure(min=0) = 101325 \"零海拔压力，Pa\"; parameter Modelica.Units.SI.Length scaleHeight(min=Modelica.Constants.small) = 8434 \"等温尺度高度，m\"</p><p><b>Behavior</b> 由任务海拔轨迹计算等温大气压力</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.EnvironmentalConditions\">ScenarioLibrary.Examples.EnvironmentalConditions</a></p>
<p>由任务海拔轨迹计算等温大气压力</p>
<p>专业分类为 Environment.Atmospheric。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealInput altitude(unit=\"m\") \"任务海拔\"</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput pressure(unit=\"Pa\") \"环境绝压\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>Modelica.Units.SI.AbsolutePressure seaLevelPressure(min=0) = 101325 \"零海拔压力，Pa\"</code></li>
<li><code>Modelica.Units.SI.Length scaleHeight(min=Modelica.Constants.small) = 8434 \"等温尺度高度，m\"</code></li>
</ul>
<p><b>时序与基准行为</b> 随海拔连续变化。零海拔输出设定压力。</p>
<p><b>最小用法</b> 接外部任务高度轨迹，pressure 接 MSL 环境边界的因果输入。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">FluidOperatingScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> 用途为 −500 至 6000 m 的近似场景。固定尺度高度忽略温度分层。</p>
</html>"));
end AmbientPressureProfile;
