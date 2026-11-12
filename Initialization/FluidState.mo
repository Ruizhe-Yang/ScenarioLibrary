within ScenarioLibrary.Initialization;
record FluidState "Pressure, temperature and composition initialization intentions"
  extends Modelica.Icons.Record;
Modelica.Units.SI.AbsolutePressure p_start(min=0)=101325;
Modelica.Units.SI.Temperature T_start(min=0)=293.15;
Real X_start[:]={1.0};
Boolean fixedP=true;
Boolean fixedT=true;
Boolean fixedX=false;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-100,48},{100,48}}, color={108,88,49}, thickness=0.5, pattern=LinePattern.Solid),
        Rectangle(extent={{-46.64,-41.08},{46.64,25.8}}, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Text(extent={{-41.36,14.36},{41.36,-22.6}}, textString="p, T, X", textColor={0,0,127}, fontSize=0),
        Text(extent={{-70,80},{70,52}}, textString="p0, T0, X0", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Pressure, temperature and composition initialization intentions.</p><p><b>Interfaces</b> The declared record fields or function arguments form the interface.</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Pressure, temperature and composition initialization intentions</p><p><b>Initialization</b> This record only stores bindings. Apply its fields as modifiers to the intended host variables.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Choose independent initial constraints appropriate to the host. A start guess is distinct from a fixed initial value.</p><p><b>Observables</b> Public outputs and the stated input conditions.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.MechanicalInitialization\">ScenarioLibrary.Examples.MechanicalInitialization</a></p></html>"));
end FluidState;
