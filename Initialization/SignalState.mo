within ScenarioLibrary.Initialization;
record SignalState "Signal start value and initialisation option"
  extends Modelica.Icons.Record;
Real x_start=0 "Initial signal, state or output value for host binding";
Modelica.Blocks.Types.Init initType=Modelica.Blocks.Types.Init.NoInit "Initialisation option to bind to a compatible block";
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-100,48},{100,48}}, color={108,88,49}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-50.16,-20.84},{-15.84,-20.84},{-15.84,17.88},{51.92,17.88}}, color={0,0,127}, thickness=1.1, pattern=LinePattern.Solid),
        Ellipse(extent={{-54.56,-25.24},{-45.76,-16.44}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-70,80},{70,52}}, textString="y0", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Store a signal start value and a Modelica.Blocks initialisation choice. Bind x_start to the host's appropriate state or output start parameter and initType to its supported initialisation option.</p><p>The record stores settings only; it does not initialise or reset a component without explicit bindings. Select fixed flags consistently with the host equations.</p></html>"));
end SignalState;
