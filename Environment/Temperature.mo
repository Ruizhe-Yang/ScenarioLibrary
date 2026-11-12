within ScenarioLibrary.Environment;
block Temperature "Planned temperature profile"
parameter Integer n(min=1)=2;
  parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n);
  parameter Modelica.Units.SI.Temperature values[n]=fill(300,n);
  Modelica.Blocks.Interfaces.RealOutput y(unit="K") annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
protected
  ScenarioLibrary.Profiles.PiecewiseLinear profile(n=n,times=times,values=values);
initial equation
  for i in 1:n loop assert(values[i]>0,"Absolute temperature must be positive."); end for;
equation
  connect(profile.y,y);
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-49.2,-4},{-38.8,30}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=4),
        Ellipse(extent={{-54,-14},{-34,6}}, lineColor={64,64,64}, fillColor={191,0,0}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-44,-2},{-44,24.8}}, color={191,0,0}, thickness=2, pattern=LinePattern.Solid),
        Line(points={{-38.4,8},{-34.4,8}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-38.4,16},{-34.4,16}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-38.4,24},{-34.4,24}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-18,-28},{5,16},{24,16},{43,42},{64,13}}, color={191,0,0}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Planned temperature profile.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput y(unit=\"K\")</p><p><b>Parameters</b> parameter Integer n(min=1)=2; parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n); parameter Modelica.Units.SI.Temperature values[n]=fill(300,n)</p><p><b>Behavior</b> Planned temperature profile</p><p><b>Initialization</b> The declared start values and initialization equations apply.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> y</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.EnvironmentalConditions\">ScenarioLibrary.Examples.EnvironmentalConditions</a></p></html>"));
end Temperature;
