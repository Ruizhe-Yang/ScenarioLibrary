within ScenarioLibrary.Operating;
block CommandSchedule "Right-continuous Boolean command schedule"
parameter Integer n(min=1)=2 "Number of table nodes";
  parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n) "Strictly increasing table times";
  parameter Boolean values[n]=fill(false,n) "Values at the table nodes";
  parameter Boolean baseline=false "Boolean output before the first table time";
  Modelica.Blocks.Interfaces.BooleanOutput y  "Scheduled Boolean command" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
protected
  Integer i "Index of the most recent table node";
initial equation
  assert(n>=1,"Empty time table.");
  for i in 2:n loop assert(times[i]>times[i-1],"Times must be strictly increasing."); end for;
equation
  i=ScenarioLibrary.Utilities.Functions.TableIndex(time,times);
  y=if i>0 then values[i] else baseline;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-59,-30},{-38,-30},{-38,31},{-5,31},{-5,-30},{22,-30},{22,31},{63,31}}, color={128,0,128}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-42,76},{58,51}}, textString="B(t)", textColor={128,0,128}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Output <code>baseline</code> before the first strictly increasing table time. At each <code>times[i]</code>, select <code>values[i]</code>. The last Boolean value is held after the final node.</p><p>The schedule uses absolute simulation time and supplies a command; it does not confirm that the receiving component has acted.</p></html>"));
end CommandSchedule;
