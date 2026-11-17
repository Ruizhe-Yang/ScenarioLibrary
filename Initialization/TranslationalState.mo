within ScenarioLibrary.Initialization;
record TranslationalState "Independent initial position and velocity settings"
  extends Modelica.Icons.Record;
Modelica.Units.SI.Position s_start=0 "Initial translational position";
Modelica.Units.SI.Velocity v_start=0 "Initial translational velocity";
Boolean fixedS=true "Request a fixed initial position when bound to the host";
Boolean fixedV=true "Request a fixed initial velocity when bound to the host";
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-100,48},{100,48}}, color={108,88,49}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-57.2,-31.4},{57.2,-31.4}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Rectangle(extent={{-29.92,-25.24},{29.92,14.36}}, lineColor={64,64,64}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-17.6,34.6},{50.16,34.6}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-70,80},{70,52}}, textString="s0, v0", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Store the initial position and velocity with independent fixed flags. Bind s_start/fixedS and v_start/fixedV to the corresponding translational state variables.</p><p>The record stores settings only; it does not initialise or reset a component without explicit bindings. Select fixed flags consistently with the host equations.</p></html>"));
end TranslationalState;
