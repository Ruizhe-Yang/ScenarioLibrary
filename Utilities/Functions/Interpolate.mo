within ScenarioLibrary.Utilities.Functions;
function Interpolate "Linear interpolation with endpoint holds"
  extends Modelica.Icons.Function;
input Real t "Coordinate at which to evaluate the profile";
  input Real times[:] "Strictly increasing coordinates";
  input Real values[size(times,1)] "Values corresponding to the coordinates";
  output Real y "Interpolated value with endpoint holds";
protected
  Integer i "Index of the latest reached coordinate";
algorithm
  assert(size(times,1)>0,"Empty profile.");
  i := TableIndex(t,times);
  if i<1 then
    y := values[1];
  elseif i>=size(times,1) then
    y := values[size(times,1)];
  else
    y := values[i]+(values[i+1]-values[i])*(t-times[i])/(times[i+1]-times[i]);
  end if;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.88,30.7},{-45.88,-39.6},{48.1,-39.6}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-37,-26.28},{37.74,15.9}}, color={0,0,127}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{0,-39.6},{0,-5.56},{37.74,-5.56}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Ellipse(extent={{-39.22,-28.5},{-34.78,-24.06}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-2.22,-7.78},{2.22,-3.34}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{35.52,13.68},{39.96,18.12}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Interpolate <code>values</code> at the coordinate <code>t</code> using the corresponding <code>times</code>. Hold the first value before the first coordinate and the last value at and after the final coordinate. A one-entry table gives a constant value.</p><p>The table must be nonempty and the caller must supply strictly increasing coordinates. The function checks only that at least one entry exists; it does not validate ordering.</p></html>"));
end Interpolate;
