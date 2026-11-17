within ScenarioLibrary;
package Timing "Clocks, phases, windows and declared task states"
  extends Modelica.Icons.Package;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-39.56,-32.2},{39.56,46.92}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{0,39.56},{0,45.08}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,7.36},{0,31.28},{0,7.36}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,7.36},{21.16,-4.6}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Polygon(points={{28.52,-24.84},{28.52,-50.6},{51.52,-37.72},{28.52,-24.84}}, lineColor={75,138,73}, fillColor={75,138,73}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5)
      }));
  annotation(Documentation(info="<html><p>Absolute and event-driven timing blocks for planned scenarios. Select clocks, phase schedules, windows or task-state declarations according to the required time semantics.</p></html>"));
end Timing;
