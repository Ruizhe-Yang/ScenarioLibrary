within ScenarioLibrary.Environment;
model FluidReservoir "Scheduled pressure and temperature fluid boundary"
  replaceable package Medium = Modelica.Media.Air.SimpleAir constrainedby Modelica.Media.Interfaces.PartialMedium;
  parameter Medium.AbsolutePressure standbyPressure(min=0) = 105000 "Absolute boundary pressure before and after the schedule";
  parameter Medium.AbsolutePressure ratedPressure(min=0) = 130000 "Absolute boundary pressure on the operating plateau";
  parameter Medium.Temperature standbyTemperature(min=0) = 293.15 "Supply temperature before and after the schedule";
  parameter Medium.Temperature ratedTemperature(min=0) = 303.15 "Supply temperature on the operating plateau";
  parameter Modelica.Units.SI.Time startTime = 1 "Start of the transition from standby";
  parameter Modelica.Units.SI.Time startupTime(min=Modelica.Constants.small) = 2 "Positive duration of the transition to rated conditions";
  parameter Modelica.Units.SI.Time operatingTime(min=0) = 5 "Duration of the rated-condition plateau";
  parameter Modelica.Units.SI.Time shutdownTime(min=Modelica.Constants.small) = 2 "Positive duration of the return to standby";
  Modelica.Fluid.Interfaces.FluidPort_b port(redeclare package Medium=Medium) "Fluid connection with reversible flow" annotation(Placement(transformation(extent={{-7,-107},{7,-93}}), iconTransformation(extent={{-7,-107},{7,-93}})));
  Modelica.Blocks.Interfaces.RealOutput pressure(unit="Pa") "Prescribed boundary pressure" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.RealOutput temperature(unit="K") "Prescribed supply temperature" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
protected
  ScenarioLibrary.Profiles.StartupHoldShutdown schedule(startTime=startTime,riseTime=startupTime,holdTime=operatingTime,fallTime=shutdownTime);
  Modelica.Fluid.Sources.Boundary_pT reservoir(redeclare package Medium=Medium,nPorts=1,use_p_in=true,use_T_in=true);
  Modelica.Blocks.Sources.RealExpression pressureSchedule(y=standbyPressure+schedule.y*(ratedPressure-standbyPressure));
  Modelica.Blocks.Sources.RealExpression temperatureSchedule(y=standbyTemperature+schedule.y*(ratedTemperature-standbyTemperature));
initial equation
  assert(min(standbyPressure,ratedPressure) > 0 and min(standbyTemperature,ratedTemperature) > 0, "Reservoir boundaries must be positive.");
equation
  connect(pressureSchedule.y, pressure);
  connect(pressureSchedule.y, reservoir.p_in);
  connect(temperatureSchedule.y, temperature);
  connect(temperatureSchedule.y, reservoir.T_in);
  connect(reservoir.ports[1], port);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-46,-44},{46,48}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-46,34},{46,60}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-46,-30},{46,-30}}, color={0,0,127}, thickness=0.7, pattern=LinePattern.Solid),
        Text(extent={{-36,28},{36,-12}}, textString="p, T", textColor={0,0,127}, fontSize=0),
        Line(points={{0,-44},{0,-100}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-27,72},{-12,72},{2,85},{21,85},{35,72}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="FluidReservoir")}),
    Documentation(info="<html><p>Drive a Modelica.Fluid pressure-temperature boundary with one common startup, hold and shutdown profile. Pressure and temperature interpolate from their standby values to rated values and then return to standby. All four boundary targets must be positive.</p><p>Redeclare <code>Medium</code> consistently with the connected network and connect <code>port</code>, which permits flow reversal. The pressure and temperature outputs expose the prescribed boundary signals. This model is an ideal boundary and contains no finite mass or energy inventory.</p></html>"));
end FluidReservoir;
