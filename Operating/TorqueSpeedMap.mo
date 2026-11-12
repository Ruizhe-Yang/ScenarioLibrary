within ScenarioLibrary.Operating;
block TorqueSpeedMap "以转速表定义正常台架负载转矩指令"
  parameter Integer n(min=2) = 3;
  parameter Real points[n,2] = [0,0;10,1;30,3] "Positive speed rad/s and opposing torque magnitude N.m";
  Modelica.Blocks.Interfaces.RealInput speed(unit="rad/s") annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Interfaces.RealOutput torque(unit="N.m") "Opposing signed demand" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
protected
  Modelica.Blocks.Tables.CombiTable1Ds profile(table=points,columns={2},
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint);
initial equation
  assert(n>=2 and abs(points[1,1])<=1e-12 and abs(points[1,2])<=1e-12 and
    min(points[:,2])>=0 and min(points[2:n,1]-points[1:n-1,1])>0,"Invalid torque map.");
equation
  profile.u = abs(speed);
  torque = -sign(speed)*profile.y[1];
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-65,0},{65,0}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{0,-52},{0,52}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-62,39},{-37,39},{-10,9},{0,0},{10,-9},{37,-39},{62,-39}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-70,76},{70,53}}, textString="tau(w)", textColor={0,0,127}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 以转速表定义正常台架负载转矩指令</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealInput speed(unit=\"rad/s\"); Modelica.Blocks.Interfaces.RealOutput torque(unit=\"N.m\") \"Opposing signed demand\"</p><p><b>Parameters</b> parameter Integer n(min=2) = 3; parameter Real points[n,2] = [0,0;10,1;30,3] \"Positive speed rad/s and opposing torque magnitude N.m\"</p><p><b>Behavior</b> 以转速表定义正常台架负载转矩指令</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.LoadAndCommandSchedules\">ScenarioLibrary.Examples.LoadAndCommandSchedules</a></p>
<p>以转速表定义正常台架负载转矩指令</p>
<p><b>行为</b> 用绝对转速查询负载幅值，符号与运动相反。表首为零，高速侧保持最大端值。</p>
<p><b>最小用法</b> 将实测转速和试验负载表接入，再把 torque 接理想或受限执行器。</p>
<p><b>适用边界</b> 该映射规定外部负载要求，无执行器动力学。</p>
<p>参数的类型、默认值和取值见下列声明。</p>
<ul>
<li><code>Integer n(min=2) = 3</code></li>
<li><code>Real points[n,2] = [0,0;10,1;30,3] \"Positive speed rad/s and opposing torque magnitude N.m\"</code></li>
</ul>
<p>接口及方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealInput speed(unit=\"rad/s\")</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput torque(unit=\"N.m\") \"Opposing signed demand\"</code></li>
</ul>
<p><a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">MultiPhaseSystemScenario</a> 提供同域宿主参考。</p>
</html>"));
end TorqueSpeedMap;
