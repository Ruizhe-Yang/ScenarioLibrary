within ScenarioLibrary.Environment;
block Temperature "Piecewise linear absolute-temperature schedule"
parameter Integer n(min=1)=2 "Number of temperature schedule points";
  parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n) "Strictly increasing simulation times";
  parameter Modelica.Units.SI.Temperature values[n]=fill(300,n) "Positive absolute-temperature values at the scheduled times";
  Modelica.Blocks.Interfaces.RealOutput y(unit="K")  "Scheduled absolute temperature" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
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
    Documentation(info="<html><p>Interpolate the positive absolute-temperature values at the specified simulation times. Values before the first point and after the last point are held at the corresponding endpoints; a one-point table gives a constant output.</p><p>Use strictly increasing times and connect <code>y</code> in kelvin to the intended signal input or prescribed-temperature boundary.</p></html>"));
end Temperature;
