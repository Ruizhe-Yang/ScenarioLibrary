within ScenarioLibrary;
package Operating "Operating commands, modes and demand schedules"
  extends Modelica.Icons.Package;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-60.72,-29.44},{-16.56,29.44}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Text(extent={{-54.28,-18.4},{-23,18.4}}, textString="1", textColor={0,0,127}, fontSize=0),
        Rectangle(extent={{16.56,-29.44},{60.72,29.44}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Text(extent={{23,-18.4},{54.28,18.4}}, textString="2", textColor={0,0,127}, fontSize=0),
        Line(points={{-13.8,0},{13.8,0}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled})
      }));
  annotation(Documentation(info="<html><p>Prescribed operating conditions include real-valued demands, Boolean and integer schedules, operating-mode selection and motion or thermal references. Connect these signals to the appropriate receiving model and interpret completion outputs as schedule information.</p></html>"));
end Operating;
