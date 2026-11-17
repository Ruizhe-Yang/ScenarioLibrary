within ScenarioLibrary.Operating;
block ThermalSoakSchedule "Exponential thermal reference with soak and restart markers"
  parameter Modelica.Units.SI.Time shutdownAt = 5 "Absolute start of the exponential thermal reference";
  parameter Modelica.Units.SI.Time soakDuration(min=Modelica.Constants.small) = 20 "Positive duration of the scheduled soak interval";
  parameter Modelica.Units.SI.Time coolingTime(min=Modelica.Constants.small) = 12 "Positive time constant of the thermal reference";
  parameter Modelica.Units.SI.Temperature operatingTemperature(min=0) = 350 "Reference temperature before shutdown";
  parameter Modelica.Units.SI.Temperature ambientTemperature(min=0) = 293.15 "Asymptotic reference temperature";
  Modelica.Blocks.Interfaces.RealOutput temperature(unit="K") "Prescribed thermal reference" annotation(Placement(transformation(extent={{94,42},{106,54}}), iconTransformation(extent={{94,42},{106,54}})));
  Modelica.Blocks.Interfaces.BooleanOutput soaking  "The scheduled soak interval is active" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
  Modelica.Blocks.Interfaces.BooleanOutput restartDue "The scheduled restart instant has been reached" annotation(Placement(transformation(extent={{94,-54},{106,-42}}), iconTransformation(extent={{94,-54},{106,-42}})));
protected
  Modelica.Units.SI.Time age "Nonnegative elapsed time since shutdown";
initial equation
  assert(soakDuration>0 and coolingTime>0 and min(operatingTemperature,ambientTemperature)>0,"Invalid thermal soak.");
equation
  age = max(0,time-shutdownAt);
  soaking = time >= shutdownAt and time < shutdownAt+soakDuration;
  restartDue = time >= shutdownAt+soakDuration;
  temperature = ambientTemperature+(operatingTemperature-ambientTemperature)*exp(-age/coolingTime);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,38},{-55.273,33.441},{-52.545,29.201},{-49.818,25.259},{-47.091,21.593},{-44.364,18.184},{-41.636,15.015},{-38.909,12.068},{-36.182,9.327},{-33.455,6.779},{-30.727,4.41},{-28,2.206},{-25.273,0.158},{-22.545,-1.747},{-19.818,-3.519},{-17.091,-5.166},{-14.364,-6.697},{-11.636,-8.122},{-8.909,-9.446},{-6.182,-10.677},{-3.455,-11.822},{-0.727,-12.887},{2,-13.877},{4.727,-14.797},{7.455,-15.653},{10.182,-16.449},{12.909,-17.189},{15.636,-17.877},{18.364,-18.517},{21.091,-19.112},{23.818,-19.666},{26.545,-20.18},{29.273,-20.659},{32,-21.103},{34.727,-21.517},{37.455,-21.902},{40.182,-22.259},{42.909,-22.592},{45.636,-22.901},{48.364,-23.188},{51.091,-23.456},{53.818,-23.704},{56.545,-23.936},{59.273,-24.151},{62,-24.35}}, color={191,0,0}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{33,-40},{33,55}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Text(extent={{-49,70},{-22,43}}, textString="T", textColor={191,0,0}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Hold <code>operatingTemperature</code> before <code>shutdownAt</code>, then relax exponentially towards <code>ambientTemperature</code> with time constant <code>coolingTime</code>. Both temperatures and the duration parameters must be positive.</p><p><code>soaking</code> is true during <code>[shutdownAt,shutdownAt+soakDuration)</code>; <code>restartDue</code> becomes true afterwards. The temperature trajectory continues beyond the soak interval, and the restart marker does not reset it.</p></html>"));
end ThermalSoakSchedule;
