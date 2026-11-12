within ScenarioLibrary.Environment;
block Gravity "Constant gravity vector in the declared world frame"
parameter Modelica.Units.SI.Acceleration g[3]={0,0,-9.80665};
  Modelica.Blocks.Interfaces.RealOutput gVector[3](each unit="m/s2") annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
equation
  gVector=g;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{0,36},{0,-50}}, color={64,64,64}, thickness=1.3, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{0,36},{46,55}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{0,36},{-45,52}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{12,-11},{47,-43}}, textString="g", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Constant gravity vector in the declared world frame.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput gVector[3](each unit=\"m/s2\")</p><p><b>Parameters</b> parameter Modelica.Units.SI.Acceleration g[3]={0,0,-9.80665}</p><p><b>Behavior</b> Constant gravity vector in the declared world frame</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> gVector</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.EnvironmentalConditions\">ScenarioLibrary.Examples.EnvironmentalConditions</a></p></html>"));
end Gravity;
