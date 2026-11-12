within ScenarioLibrary.Initialization;
record RotationalState "Independent angular position and angular velocity bindings"
  extends Modelica.Icons.Record;
Modelica.Units.SI.Angle phi_start=0;
Modelica.Units.SI.AngularVelocity w_start=0;
Boolean fixedPhi=true;
Boolean fixedW=true;
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
    Documentation(info="<html><p><b>Purpose</b> Independent angular position and angular velocity bindings.</p><p><b>Interfaces</b> The declared record fields or function arguments form the interface.</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Independent angular position and angular velocity bindings</p><p><b>Initialization</b> This record only stores bindings. Apply its fields as modifiers to the intended host variables.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Choose independent initial constraints appropriate to the host. A start guess is distinct from a fixed initial value.</p><p><b>Observables</b> Public outputs and the stated input conditions.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.MechanicalInitialization\">ScenarioLibrary.Examples.MechanicalInitialization</a></p></html>"));
end RotationalState;
