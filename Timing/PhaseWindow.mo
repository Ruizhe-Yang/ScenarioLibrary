within ScenarioLibrary.Timing;
block PhaseWindow "Qualify one phase of an external schedule"
parameter Integer targetPhase(min=1)=2;
    Modelica.Blocks.Interfaces.IntegerInput phaseIndex annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput active annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
equation
  active=phaseIndex==targetPhase;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-67,-30},{67,-30}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Rectangle(extent={{-60,-26},{-28,26}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-16,-26},{16,26}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{28,-26},{60,26}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Text(extent={{-60,-23},{-28,23}}, textString="1", textColor={0,0,127}, fontSize=0),
        Text(extent={{-16,-23},{16,23}}, textString="2", textColor={0,0,127}, fontSize=0),
        Text(extent={{28,-23},{60,23}}, textString="3", textColor={0,0,127}, fontSize=0),
        Rectangle(extent={{-18,-29},{18,29}}, lineColor={75,138,73}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=1.3, radius=0),
        Text(extent={{-22,69},{22,38}}, textString="=", textColor={75,138,73}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Qualify one phase of an external schedule.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.IntegerInput phaseIndex; Modelica.Blocks.Interfaces.BooleanOutput active</p><p><b>Parameters</b> parameter Integer targetPhase(min=1)=2</p><p><b>Behavior</b> Qualify one phase of an external schedule</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> active</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.PhaseQualifiedWindows\">ScenarioLibrary.Examples.PhaseQualifiedWindows</a></p></html>"));
end PhaseWindow;
