within ScenarioLibrary;
package Environment "Environmental signals and physical boundaries"
  extends Modelica.Icons.Package;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-11.04,4.6},{11.04,26.68}}, lineColor={191,0,0}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{15.456,15.64},{22.08,15.64}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{10.929,26.569},{15.613,31.253}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,31.096},{0,37.72}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-10.929,26.569},{-15.613,31.253}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-15.456,15.64},{-22.08,15.64}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-10.929,4.711},{-15.613,0.027}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,0.184},{0,-6.44}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{10.929,4.711},{15.613,0.027}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-59.8,-34.04},{-30.36,-12.88},{-6.44,-34.04},{24.84,-5.52},{58.88,-34.04}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid)
      }));
  annotation(Documentation(info="<html><p>Planned environmental signals and selected physical boundary models. Choose the required signal or physical interface and retain the documented units, coordinate conventions and validity range.</p></html>"));
end Environment;
