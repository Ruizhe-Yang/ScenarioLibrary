within ScenarioLibrary.Environment;
model GravitySetting "按任务坡度给质量体施加重力切向分量"
  parameter Modelica.Units.SI.Mass carriedMass(min=0) = 10 "参与重力的质量，kg";
  parameter Modelica.Units.SI.Acceleration gravity(min=0) = Modelica.Constants.g_n "当地重力幅值，m/s2";
  Modelica.Blocks.Interfaces.RealInput grade(unit="rad") "正值表示沿运动正向下坡" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange "受载平动部件" annotation(Placement(transformation(extent={{-7,-107},{7,-93}}), iconTransformation(extent={{-7,-107},{7,-93}})));
  Modelica.Blocks.Interfaces.RealOutput force(unit="N") "施加给部件的切向重力" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
protected
  Modelica.Mechanics.Translational.Sources.Force load;
initial equation
  assert(carriedMass >= 0 and gravity >= 0, "Gravity and participating mass must be nonnegative.");
equation
  assert(noEvent(abs(grade) <= Modelica.Constants.pi/2), "Grade must be within a half turn centered at level.");
  force = carriedMass*gravity*sin(grade);
  load.f = force;
  connect(load.flange, flange);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Line(points={{-66,-45},{62,23}}, color={64,64,64}, thickness=1, pattern=LinePattern.Solid),
        Polygon(points={{-22,-22},{18,-1},{1,31},{-39,10},{-22,-22}}, lineColor={64,64,64}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-4,8},{-4,-65}}, color={64,64,64}, thickness=1, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{10,-35},{36,-61}}, textString="g", textColor={64,64,64}, fontSize=0),
        Line(points={{0,-68},{0,-100}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="GravitySetting")}),
    Documentation(info="<html><p><b>Purpose</b> 按任务坡度给质量体施加重力切向分量</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealInput grade(unit=\"rad\") \"正值表示沿运动正向下坡\"; Modelica.Mechanics.Translational.Interfaces.Flange_b flange \"受载平动部件\"; Modelica.Blocks.Interfaces.RealOutput force(unit=\"N\") \"施加给部件的切向重力\"</p><p><b>Parameters</b> parameter Modelica.Units.SI.Mass carriedMass(min=0) = 10 \"参与重力的质量，kg\"; parameter Modelica.Units.SI.Acceleration gravity(min=0) = Modelica.Constants.g_n \"当地重力幅值，m/s2\"</p><p><b>Behavior</b> 按任务坡度给质量体施加重力切向分量</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.EnvironmentalConditions\">ScenarioLibrary.Examples.EnvironmentalConditions</a></p>
<p>按任务坡度给质量体施加重力切向分量</p>
<p>专业分类为 Environment.Mechanical。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealInput grade(unit=\"rad\") \"正值表示沿运动正向下坡\"</code></li>
<li><code>Modelica.Mechanics.Translational.Interfaces.Flange_b flange \"受载平动部件\"</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput force(unit=\"N\") \"施加给部件的切向重力\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>Modelica.Units.SI.Mass carriedMass(min=0) = 10 \"参与重力的质量，kg\"</code></li>
<li><code>Modelica.Units.SI.Acceleration gravity(min=0) = Modelica.Constants.g_n \"当地重力幅值，m/s2\"</code></li>
</ul>
<p><b>时序与基准行为</b> 给定坡度即时确定重力分量。水平时作用为零。</p>
<p><b>最小用法</b> 接到沿坡道运动的 Mass，grade 由计划路径提供。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">MechanicalMissionScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> 仅表示一维外部重力投影。地面反力和摩擦由宿主设置。</p>
</html>"));
end GravitySetting;
