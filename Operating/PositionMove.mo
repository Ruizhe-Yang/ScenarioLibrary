within ScenarioLibrary.Operating;
block PositionMove "生成速度和加速度两端均平滑的位置移动指令"
  parameter Modelica.Units.SI.Position initialPosition = 0 "起始位置，m";
  parameter Modelica.Units.SI.Position targetPosition = 1 "目标位置，m";
  parameter Modelica.Units.SI.Time startTime = 1 "运动起点，s";
  parameter Modelica.Units.SI.Time duration(min=Modelica.Constants.small) = 2 "运动持续时间，s";
  Modelica.Blocks.Interfaces.RealOutput position(unit="m") "任务位置" annotation(Placement(transformation(extent={{94,42},{106,54}}), iconTransformation(extent={{94,42},{106,54}})));
  Modelica.Blocks.Interfaces.RealOutput velocity(unit="m/s") "位置轨迹的解析导数" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
  Modelica.Blocks.Interfaces.BooleanOutput arrived "计划轨迹达到终点" annotation(Placement(transformation(extent={{94,-54},{106,-42}}), iconTransformation(extent={{94,-54},{106,-42}})));
protected
  Real x(min=0,max=1);
  Modelica.Units.SI.Length travel;
initial equation
  assert(duration > 0, "Move duration must be positive.");
equation
  x = min(1,max(0,(time-startTime)/duration));
  travel = targetPosition-initialPosition;
  position = initialPosition+travel*x^3*(10+x*(-15+6*x));
  velocity = travel*30*x^2*(1-x)^2/duration;
  arrived = time >= startTime+duration;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-30},{-55.273,-29.992},{-52.545,-29.937},{-49.818,-29.794},{-47.091,-29.53},{-44.364,-29.115},{-41.636,-28.527},{-38.909,-27.749},{-36.182,-26.767},{-33.455,-25.574},{-30.727,-24.167},{-28,-22.547},{-25.273,-20.718},{-22.545,-18.687},{-19.818,-16.468},{-17.091,-14.072},{-14.364,-11.517},{-11.636,-8.821},{-8.909,-6.005},{-6.182,-3.091},{-3.455,-0.103},{-0.727,2.936},{2,6},{4.727,9.064},{7.455,12.103},{10.182,15.091},{12.909,18.005},{15.636,20.821},{18.364,23.517},{21.091,26.072},{23.818,28.468},{26.545,30.687},{29.273,32.718},{32,34.547},{34.727,36.167},{37.455,37.574},{40.182,38.767},{42.909,39.749},{45.636,40.527},{48.364,41.115},{51.091,41.53},{53.818,41.794},{56.545,41.937},{59.273,41.992},{62,42}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,73},{66,48}}, textString="s(t)", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="PositionMove")}),
    Documentation(info="<html><p><b>Purpose</b> 生成速度和加速度两端均平滑的位置移动指令</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput position(unit=\"m\") \"任务位置\"; Modelica.Blocks.Interfaces.RealOutput velocity(unit=\"m/s\") \"位置轨迹的解析导数\"; Modelica.Blocks.Interfaces.BooleanOutput arrived \"计划轨迹达到终点\"</p><p><b>Parameters</b> parameter Modelica.Units.SI.Position initialPosition = 0 \"起始位置，m\"; parameter Modelica.Units.SI.Position targetPosition = 1 \"目标位置，m\"; parameter Modelica.Units.SI.Time startTime = 1 \"运动起点，s\"; parameter Modelica.Units.SI.Time duration(min=Modelica.Constants.small) = 2 \"运动持续时间，s\"</p><p><b>Behavior</b> 生成速度和加速度两端均平滑的位置移动指令</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.LoadAndCommandSchedules\">ScenarioLibrary.Examples.LoadAndCommandSchedules</a></p>
<p>生成速度和加速度两端均平滑的位置移动指令</p>
<p>专业分类为 ExternalInputs.Position。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealOutput position(unit=\"m\") \"任务位置\"</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput velocity(unit=\"m/s\") \"位置轨迹的解析导数\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput arrived \"计划轨迹达到终点\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>Modelica.Units.SI.Position initialPosition = 0 \"起始位置，m\"</code></li>
<li><code>Modelica.Units.SI.Position targetPosition = 1 \"目标位置，m\"</code></li>
<li><code>Modelica.Units.SI.Time startTime = 1 \"运动起点，s\"</code></li>
<li><code>Modelica.Units.SI.Time duration(min=Modelica.Constants.small) = 2 \"运动持续时间，s\"</code></li>
</ul>
<p><b>时序与基准行为</b> 五次曲线从静止参考进入移动并在终点平滑保持。支持反向移动。</p>
<p><b>最小用法</b> 将 position、velocity 分别接位置与速度前馈。真实到达可由实际位置反馈观测。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">MechanicalMissionScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> 时长和位移决定峰速度。由系统任务确定可用行程和执行能力。</p>
</html>"));
end PositionMove;
