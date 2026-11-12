within ScenarioLibrary.Initialization;
record TranslationalState "Independent translational position and velocity bindings"
  extends Modelica.Icons.Record;
Modelica.Units.SI.Position s_start=0;
Modelica.Units.SI.Velocity v_start=0;
Boolean fixedS=true;
Boolean fixedV=true;
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
    Documentation(info="<html><p><b>Purpose</b> Independent translational position and velocity bindings.</p><p><b>Interfaces</b> The declared record fields or function arguments form the interface.</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Independent translational position and velocity bindings</p><p><b>Initialization</b> This record only stores bindings. Apply its fields as modifiers to the intended host variables.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Choose independent initial constraints appropriate to the host. A start guess is distinct from a fixed initial value.</p><p><b>Observables</b> Public outputs and the stated input conditions.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.MechanicalInitialization\">ScenarioLibrary.Examples.MechanicalInitialization</a></p></html>"));
end TranslationalState;
