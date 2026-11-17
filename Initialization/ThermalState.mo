within ScenarioLibrary.Initialization;
record ThermalState "Temperature initial-state setting and fixed flag"
  extends Modelica.Icons.Record;
Modelica.Units.SI.Temperature T_start(min=0,displayUnit="degC")=293.15 "Initial absolute temperature";
Boolean fixedT=true "Request a fixed initial temperature when bound to the host";
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
    Documentation(info="<html><p>Store an absolute temperature start value and its fixed flag. The declared unit is kelvin, with degrees Celsius used only as the display unit.</p><p>The record stores settings only; it does not initialise or reset a component without explicit bindings. Select fixed flags consistently with the host equations.</p></html>"));
end ThermalState;
