within ScenarioLibrary.Utilities;
package Functions "Ordered-table lookup and interpolation"
  extends Modelica.Icons.Package;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-55.2,-55.2},{55.2,55.2}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-38.64,44.16},{38.64,-44.16}}, textString="f", textColor={108,88,49}, fontSize=0)
      }));
  annotation(Documentation(info="<html><p>Functions for locating table entries and interpolating scalar values. Callers supply the ordering and units appropriate to their profiles.</p></html>"));
end Functions;
