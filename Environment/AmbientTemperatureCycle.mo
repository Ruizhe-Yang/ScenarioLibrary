within ScenarioLibrary.Environment;
block AmbientTemperatureCycle "Periodic ambient temperature with a prescribed peak time"
  parameter Modelica.Units.SI.Temperature minimumTemperature(min=0) = 288.15 "Minimum absolute temperature in the cycle";
  parameter Modelica.Units.SI.Temperature maximumTemperature(min=0) = 303.15 "Maximum absolute temperature in the cycle";
  parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 86400 "Positive repetition period";
  parameter Modelica.Units.SI.Time peakTime = 50400 "Time of any temperature maximum";
  Modelica.Blocks.Interfaces.RealOutput temperature(unit="K") "Prescribed ambient absolute temperature" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
initial equation
  assert(minimumTemperature > 0 and maximumTemperature >= minimumTemperature and period > 0, "Invalid ambient cycle.");
equation
  temperature = 0.5*(minimumTemperature+maximumTemperature) +
    0.5*(maximumTemperature-minimumTemperature)*cos(2*Modelica.Constants.pi*(time-peakTime)/period);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-45.46,-6.7},{-34.54,29}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=4.2),
        Ellipse(extent={{-50.5,-17.2},{-29.5,3.8}}, lineColor={64,64,64}, fillColor={191,0,0}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-40,-4.6},{-40,23.54}}, color={191,0,0}, thickness=2, pattern=LinePattern.Solid),
        Line(points={{-34.12,5.9},{-29.92,5.9}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-34.12,14.3},{-29.92,14.3}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-34.12,22.7},{-29.92,22.7}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-15,33},{-13.182,32.715},{-11.364,31.866},{-9.545,30.47},{-7.727,28.555},{-5.909,26.161},{-4.091,23.336},{-2.273,20.138},{-0.455,16.632},{1.364,12.889},{3.182,8.985},{5,5},{6.818,1.015},{8.636,-2.889},{10.455,-6.632},{12.273,-10.138},{14.091,-13.336},{15.909,-16.161},{17.727,-18.555},{19.545,-20.47},{21.364,-21.866},{23.182,-22.715},{25,-23},{26.818,-22.715},{28.636,-21.866},{30.455,-20.47},{32.273,-18.555},{34.091,-16.161},{35.909,-13.336},{37.727,-10.138},{39.545,-6.632},{41.364,-2.889},{43.182,1.015},{45,5},{46.818,8.985},{48.636,12.889},{50.455,16.632},{52.273,20.138},{54.091,23.336},{55.909,26.161},{57.727,28.555},{59.545,30.47},{61.364,31.866},{63.182,32.715},{65,33}}, color={191,0,0}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="AmbientTemperatureCycle")}),
    Documentation(info="<html><p>Generate a cosine temperature cycle between <code>minimumTemperature</code> and <code>maximumTemperature</code>. A peak occurs at <code>peakTime</code> and repeats every <code>period</code>.</p><p>The cycle is defined over the whole simulation, including instants before peakTime. Set positive absolute temperatures, an ordered range and a positive period; the temperature output is in kelvin.</p></html>"));
end AmbientTemperatureCycle;
