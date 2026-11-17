within ScenarioLibrary.Initialization;
record FluidState "Fluid pressure, temperature and composition initial-state settings"
  extends Modelica.Icons.Record;
Modelica.Units.SI.AbsolutePressure p_start(min=0)=101325 "Initial absolute pressure";
Modelica.Units.SI.Temperature T_start(min=0)=293.15 "Initial absolute temperature";
Real X_start[:]={1.0} "Initial composition fractions in host-medium order";
Boolean fixedP=true "Request fixed initial pressure when bound to the host";
Boolean fixedT=true "Request fixed initial temperature when bound to the host";
Boolean fixedX=false "Request fixed initial composition when bound to the host";
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-100,48},{100,48}}, color={108,88,49}, thickness=0.5, pattern=LinePattern.Solid),
        Rectangle(extent={{-46.64,-41.08},{46.64,25.8}}, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Text(extent={{-41.36,14.36},{41.36,-22.6}}, textString="p, T, X", textColor={0,0,127}, fontSize=0),
        Text(extent={{-70,80},{70,52}}, textString="p0, T0, X0", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Store pressure, temperature and composition start values with independent fixed flags. The composition array is unconstrained in length; match it to the receiving medium and provide physically valid fractions.</p><p>The record stores settings only; it does not initialise or reset a component without explicit bindings. Composition validity and host initialisation consistency are not checked by this record. Select fixed flags consistently with the host equations.</p></html>"));
end FluidState;
