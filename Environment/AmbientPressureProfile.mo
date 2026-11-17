within ScenarioLibrary.Environment;
block AmbientPressureProfile "Isothermal atmospheric pressure from an altitude signal"
  parameter Modelica.Units.SI.AbsolutePressure seaLevelPressure(min=0) = 101325 "Absolute pressure at zero altitude";
  parameter Modelica.Units.SI.Length scaleHeight(min=Modelica.Constants.small) = 8434 "Positive exponential pressure scale height";
  Modelica.Blocks.Interfaces.RealInput altitude(unit="m") "Altitude relative to the pressure reference level" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Interfaces.RealOutput pressure(unit="Pa") "Calculated absolute atmospheric pressure" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
initial equation
  assert(seaLevelPressure > 0 and scaleHeight > 0, "Positive atmosphere scales required.");
equation
  assert(noEvent(altitude >= -500 and altitude <= 6000), "Altitude outside the configured isothermal profile range.");
  pressure = seaLevelPressure*exp(-altitude/scaleHeight);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,45},{-55.273,40.753},{-52.545,36.732},{-49.818,32.924},{-47.091,29.318},{-44.364,25.904},{-41.636,22.671},{-38.909,19.61},{-36.182,16.711},{-33.455,13.966},{-30.727,11.366},{-28,8.905},{-25.273,6.574},{-22.545,4.367},{-19.818,2.278},{-17.091,0.299},{-14.364,-1.575},{-11.636,-3.35},{-8.909,-5.03},{-6.182,-6.621},{-3.455,-8.127},{-0.727,-9.554},{2,-10.904},{4.727,-12.184},{7.455,-13.395},{10.182,-14.542},{12.909,-15.628},{15.636,-16.656},{18.364,-17.63},{21.091,-18.552},{23.818,-19.425},{26.545,-20.252},{29.273,-21.035},{32,-21.776},{34.727,-22.478},{37.455,-23.143},{40.182,-23.772},{42.909,-24.368},{45.636,-24.933},{48.364,-25.467},{51.091,-25.973},{53.818,-26.452},{56.545,-26.906},{59.273,-27.336},{62,-27.743}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,73},{66,48}}, textString="p(h)", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="AmbientPressureProfile")}),
    Documentation(info="<html><p>Calculate <code>pressure=seaLevelPressure*exp(-altitude/scaleHeight)</code>. The pressure and scale-height parameters must be positive.</p><p>Connect altitude in metres and use the pressure output in pascals. The declared validity interval is -500 to 6000 m. This is an isothermal exponential profile; it does not provide temperature or density.</p></html>"));
end AmbientPressureProfile;
