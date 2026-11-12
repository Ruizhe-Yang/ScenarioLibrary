within ScenarioLibrary.Timing;
block DwellTrigger "One visible event per continuous qualified dwell"
parameter Modelica.Units.SI.Time dwellTime(min=0)=0.3;
    Modelica.Blocks.Interfaces.BooleanInput condition annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput fired annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.IntegerOutput count(start=0,fixed=true) annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
protected
  discrete Modelica.Units.SI.Time began(start=0,fixed=true);
initial equation
  assert(dwellTime>=0,"Negative dwell time.");
equation
  when {initial(),condition} then began=time; end when;
  fired=condition and time>=began+dwellTime;
  when {initial(),fired} then count=(if initial() then 0 else pre(count))+(if fired then 1 else 0); end when;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-64,-26},{-43,-26},{-43,24},{61,24}}, color={128,0,128}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{-43,49},{14,49}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.Filled,Arrow.Filled}),
        Line(points={{14,-52},{14,-7},{31,-7},{31,-52},{62,-52}}, color={128,0,128}, thickness=1.1, pattern=LinePattern.Solid),
        Text(extent={{-25,73},{6,53}}, textString="dt", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> One visible event per continuous qualified dwell.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.BooleanInput condition; Modelica.Blocks.Interfaces.BooleanOutput fired; Modelica.Blocks.Interfaces.IntegerOutput count(start=0,fixed=true)</p><p><b>Parameters</b> parameter Modelica.Units.SI.Time dwellTime(min=0)=0.3</p><p><b>Behavior</b> One visible event per continuous qualified dwell</p><p><b>Initialization</b> The declared start values and initialization equations apply.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> fired, count</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.PhaseQualifiedWindows\">ScenarioLibrary.Examples.PhaseQualifiedWindows</a></p></html>"));
end DwellTrigger;
