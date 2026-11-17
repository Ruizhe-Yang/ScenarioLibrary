within;
package ScenarioLibrary "Deterministic initial conditions, planned inputs and timing"
  extends Modelica.Icons.Package;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-39.56,-32.2},{39.56,46.92}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{0,39.56},{0,45.08}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,7.36},{0,31.28},{0,7.36}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,7.36},{21.16,-4.6}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Polygon(points={{28.52,-24.84},{28.52,-50.6},{51.52,-37.72},{28.52,-24.84}}, lineColor={75,138,73}, fillColor={75,138,73}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-53.36,-54.28},{-15.64,-54.28},{-15.64,-38.64},{36.8,-38.64}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid)
      }),
    uses(Modelica(version="4.0.0")), version="1.0.0", Documentation(info="<html><p>ScenarioLibrary provides initial-state records, planned signal profiles, environmental inputs, physical boundaries and timing components for Modelica simulations. Its only library dependency is Modelica Standard Library 4.0.0.</p><p>Begin with <a href=\"modelica://ScenarioLibrary.UsersGuide\">UsersGuide</a> and <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">Examples.MultiphaseMission</a>. Connect or bind each scenario element explicitly to the receiving model.</p></html>"));
end ScenarioLibrary;
