within ScenarioLibrary.Utilities;
package Views "Compact views of planned scenario signals"
  extends Modelica.Icons.Package;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-56.12,-45.08},{56.12,45.08}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-56.12,15.64},{56.12,15.64}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Line(points={{-14.72,-45.08},{-14.72,45.08}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Text(extent={{-48.76,9.2},{-21.16,-34.04}}, textString="y", textColor={0,0,127}, fontSize=0),
        Line(points={{-4.6,-2.76},{41.4,-2.76}}, color={128,128,128}, thickness=0.7, pattern=LinePattern.Solid),
        Line(points={{-4.6,-24.84},{28.52,-24.84}}, color={128,128,128}, thickness=0.7, pattern=LinePattern.Solid)
      }));
  annotation(Documentation(info="<html><p>Signal views used to expose planned quantities in example models.</p></html>"));
end Views;
