within ScenarioLibrary.Utilities.Functions;
function TableIndex "Right-continuous index in an ordered coordinate table"
  extends Modelica.Icons.Function;
input Real t "Coordinate to locate in the table";
  input Real times[:] "Ordered coordinates";
  output Integer i "Last qualifying array index, or zero";
algorithm
  i := 0;
  for k in 1:size(times,1) loop
    if t>=times[k] then i := k; end if;
  end for;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-44.4,-37.38},{45.88,-37.38}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Rectangle(extent={{-39.96,-29.98},{39.96,11.46}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-13.32,-29.98},{-13.32,11.46}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{13.32,-29.98},{13.32,11.46}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{-37,3.32},{-16.28,-21.84}}, textString="1", textColor={0,0,127}, fontSize=0),
        Text(extent={{-10.36,3.32},{10.36,-21.84}}, textString="2", textColor={0,0,127}, fontSize=0),
        Text(extent={{16.28,3.32},{37,-21.84}}, textString="3", textColor={0,0,127}, fontSize=0),
        Line(points={{0,39.58},{0,13.68}}, color={64,64,64}, thickness=0.9, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Return the last array index whose coordinate is less than or equal to <code>t</code>, or zero if no entry qualifies. With strictly increasing <code>times</code>, an exact table coordinate selects that entry and the final index is retained beyond the table.</p><p>An empty table returns zero. The function does not validate ordering; callers that require time-table semantics must supply an ordered table.</p></html>"));
end TableIndex;
