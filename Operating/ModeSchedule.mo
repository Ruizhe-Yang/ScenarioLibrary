within ScenarioLibrary.Operating;
block ModeSchedule "Right-continuous integer mode schedule"
parameter Integer n(min=1)=2 "Number of table nodes";
  parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n) "Strictly increasing table times";
  parameter Integer values[n]=fill(0,n) "Values at the table nodes";
  parameter Integer baseline=0 "Integer output before the first table time";
  Modelica.Blocks.Interfaces.IntegerOutput y  "Scheduled integer mode code" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
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
        Line(points={{-59,-30},{-35,-30},{-35,4},{3,4},{3,34},{34,34},{34,4},{63,4}}, color={180,100,0}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,-22},{-36,2}}, textString="1", textColor={64,64,64}, fontSize=0),
        Text(extent={{-24,9},{0,33}}, textString="2", textColor={64,64,64}, fontSize=0),
        Text(extent={{6,39},{30,63}}, textString="3", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Output the integer <code>baseline</code> before the first table time, then select <code>values[i]</code> at each strictly increasing <code>times[i]</code>. Hold the final integer value after the table.</p><p>The schedule uses absolute simulation time. Its output is an integer code, so the receiving model defines the meaning of each value.</p></html>"));
end ModeSchedule;
