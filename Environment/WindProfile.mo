within ScenarioLibrary.Environment;
block WindProfile "Nonnegative scalar wind speed with sinusoidal modulation"
  parameter Modelica.Units.SI.Velocity meanWind(min=0) = 3 "Mean nonnegative wind speed";
  parameter Modelica.Units.SI.Velocity modulation(min=0) = 1 "Nonnegative sinusoidal speed amplitude";
  parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 12 "Positive wind modulation period";
  parameter Modelica.Units.SI.Time phaseOrigin = 0 "Rising mean-crossing time";
  Modelica.Blocks.Interfaces.RealOutput speed(unit="m/s") "Nonnegative scalar wind speed" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
initial equation
  assert(meanWind >= modulation and modulation >= 0 and period > 0, "Invalid wind profile.");
equation
  speed = meanWind+modulation*sin(2*Modelica.Constants.pi*(time-phaseOrigin)/period);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,30},{8,30},{25,43},{38,41},{44,30},{39,19},{25,18}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-62,0},{42,0},{53,10},{63,6},{65,-6},{56,-14}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-55,-30},{7,-30},{20,-42},{35,-40}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-25,70},{60,45}}, textString="v(t)", textColor={0,0,127}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="WindProfile")}),
    Documentation(info="<html><p>Generate <code>speed=meanWind+modulation*sin(2*pi*(time-phaseOrigin)/period)</code>. The mean must be at least the nonnegative modulation amplitude, and the period must be positive.</p><p>phaseOrigin is the mean-crossing instant on the rising part of the cycle. The periodic signal is defined throughout the simulation and contains no direction or aerodynamic-force calculation.</p></html>"));
end WindProfile;
