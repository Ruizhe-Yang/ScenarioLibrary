within ScenarioLibrary.Initialization;
record ThermalState "Temperature start value and fixed flag"
  extends Modelica.Icons.Record;
Modelica.Units.SI.Temperature T_start(min=0,displayUnit="degC")=293.15;
Boolean fixedT=true;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-100,48},{100,48}}, color={108,88,49}, thickness=0.5, pattern=LinePattern.Solid),
        Rectangle(extent={{-8.4656,-27.792},{8.4656,27.56}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=6.512),
        Ellipse(extent={{-16.28,-44.072},{16.28,-11.512}}, lineColor={64,64,64}, fillColor={191,0,0}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{0,-24.536},{0,19.0944}}, color={191,0,0}, thickness=2, pattern=LinePattern.Solid),
        Line(points={{9.1168,-8.256},{15.6288,-8.256}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{9.1168,4.768},{15.6288,4.768}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{9.1168,17.792},{15.6288,17.792}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Text(extent={{-70,80},{70,52}}, textString="T0", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Temperature start value and fixed flag.</p><p><b>Interfaces</b> The declared record fields or function arguments form the interface.</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Temperature start value and fixed flag</p><p><b>Initialization</b> This record only stores bindings. Apply its fields as modifiers to the intended host variables.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Choose independent initial constraints appropriate to the host. A start guess is distinct from a fixed initial value.</p><p><b>Observables</b> Public outputs and the stated input conditions.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.MechanicalInitialization\">ScenarioLibrary.Examples.MechanicalInitialization</a></p></html>"));
end ThermalState;
