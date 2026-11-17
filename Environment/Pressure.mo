within ScenarioLibrary.Environment;
block Pressure "Piecewise linear absolute-pressure schedule"
parameter Integer n(min=1)=2 "Number of pressure schedule points";
  parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n) "Strictly increasing simulation times";
  parameter Modelica.Units.SI.AbsolutePressure values[n]=fill(101325,n) "Positive absolute-pressure values at the scheduled times";
  Modelica.Blocks.Interfaces.RealOutput y(unit="Pa")  "Scheduled absolute pressure" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
protected
  ScenarioLibrary.Profiles.PiecewiseLinear profile(n=n,times=times,values=values);
initial equation
  for i in 1:n loop assert(values[i]>0,"Absolute pressure must be positive."); end for;
equation
  connect(profile.y,y);
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-23},{-25,32},{12,32},{38,3},{64,18}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,73},{66,48}}, textString="p(t)", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Interpolate the positive absolute-pressure values at the specified simulation times. Values before the first point and after the last point are held at the corresponding endpoints; a one-point table gives a constant output.</p><p>Use strictly increasing times and connect <code>y</code> to a compatible pressure-signal input. The block defines a signal schedule and has no physical fluid connector.</p></html>"));
end Pressure;
