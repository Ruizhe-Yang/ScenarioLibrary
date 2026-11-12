within ScenarioLibrary.Timing;
block TimeWindow "Absolute half-open observation or operating window"
parameter Modelica.Units.SI.Time startTime=1;
  parameter Modelica.Units.SI.Time endTime=3;
    Modelica.Blocks.Interfaces.BooleanOutput active annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput completed annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
initial equation
  assert(endTime>=startTime,"Reversed window.");
equation
  active=time>=startTime and time<endTime;
  completed=time>=endTime;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-63,-31},{-32,-31},{-32,34},{35,34},{35,-31},{64,-31}}, color={128,0,128}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-32,-49},{-32,54}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Dash),
        Line(points={{35,-49},{35,54}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Dash),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Absolute half-open observation or operating window.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.BooleanOutput active; Modelica.Blocks.Interfaces.BooleanOutput completed</p><p><b>Parameters</b> parameter Modelica.Units.SI.Time startTime=1; parameter Modelica.Units.SI.Time endTime=3</p><p><b>Behavior</b> The left edge is included. The right edge is excluded. Equal bounds give an empty window.</p><p><b>Initialization</b> The declared start values and initialization equations apply.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> active, completed</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.PhaseQualifiedWindows\">ScenarioLibrary.Examples.PhaseQualifiedWindows</a></p></html>"));
end TimeWindow;
