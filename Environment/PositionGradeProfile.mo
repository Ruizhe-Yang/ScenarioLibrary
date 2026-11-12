within ScenarioLibrary.Environment;
block PositionGradeProfile "沿已知路径按位置插值坡度"
  parameter Integer n(min=2) = 3;
  parameter Real stations[n,2] = [0,0;0.5,0.08;1,0.08] "Columns are position in m and grade in rad";
  Modelica.Blocks.Interfaces.RealInput position(unit="m") "Along-path location" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Interfaces.RealOutput grade(unit="rad") annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
protected
  Modelica.Blocks.Tables.CombiTable1Ds profile(table=stations,columns={2},
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint);
initial equation
  assert(n>=2 and min(stations[2:n,1]-stations[1:n-1,1])>0 and max(abs(stations[:,2]))<=Modelica.Constants.pi/2,
    "Stations must be ordered and grade must lie within +/-pi/2.");
equation
  profile.u = position;
  connect(profile.y[1],grade);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-24},{-22,-24},{25,28},{62,28}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,73},{66,48}}, textString="grade(s)", textColor={64,64,64}, fontSize=0),
        Ellipse(extent={{-61,-27},{-55,-21}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-25,-27},{-19,-21}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{22,25},{28,31}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{59,25},{65,31}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 沿已知路径按位置插值坡度</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealInput position(unit=\"m\") \"Along-path location\"; Modelica.Blocks.Interfaces.RealOutput grade(unit=\"rad\")</p><p><b>Parameters</b> parameter Integer n(min=2) = 3; parameter Real stations[n,2] = [0,0;0.5,0.08;1,0.08] \"Columns are position in m and grade in rad\"</p><p><b>Behavior</b> 沿已知路径按位置插值坡度</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.EnvironmentalConditions\">ScenarioLibrary.Examples.EnvironmentalConditions</a></p>
<p>沿已知路径按位置插值坡度</p>
<p><b>行为</b> 路径节点间线性插值，越过两端保持端值。反向移动按相同位置表读取。</p>
<p><b>最小用法</b> 接实际滑台位置，并把 grade 送至 GravitySetting 或宿主重力参数化模型。</p>
<p><b>适用边界</b> 场景路径表用于外部边界。轮地接触和实际重力投影由物理组件负责。</p>
<p>参数的类型、默认值和取值见下列声明。</p>
<ul>
<li><code>Integer n(min=2) = 3</code></li>
<li><code>Real stations[n,2] = [0,0;0.5,0.08;1,0.08] \"Columns are position in m and grade in rad\"</code></li>
</ul>
<p>接口及方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealInput position(unit=\"m\") \"Along-path location\"</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput grade(unit=\"rad\")</code></li>
</ul>
<p><a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">MechanicalMissionScenario</a> 提供同域宿主参考。</p>
</html>"));
end PositionGradeProfile;
