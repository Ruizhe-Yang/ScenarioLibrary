within ScenarioLibrary.Initialization;
record RotationalState "Independent initial angle and angular velocity settings"
  extends Modelica.Icons.Record;
Modelica.Units.SI.Angle phi_start=0 "Initial angular position";
Modelica.Units.SI.AngularVelocity w_start=0 "Initial angular velocity";
Boolean fixedPhi=true "Request a fixed initial angle when bound to the host";
Boolean fixedW=true "Request a fixed initial angular velocity when bound to the host";
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-100,48},{100,48}}, color={108,88,49}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-59.84,-5},{59.84,-5}}, color={64,64,64}, thickness=1.2, pattern=LinePattern.Solid),
        Ellipse(extent={{-34.32,-39.32},{34.32,29.32}}, lineColor={64,64,64}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-8.8,-13.8},{8.8,3.8}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{0,-5},{22,17}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{-70,80},{70,52}}, textString="phi0, w0", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Store the initial angle and angular velocity with independent fixed flags. Bind phi_start/fixedPhi and w_start/fixedW to the corresponding rotational state variables.</p><p>The record stores settings only; it does not initialise or reset a component without explicit bindings. Select fixed flags consistently with the host equations.</p></html>"));
end RotationalState;
