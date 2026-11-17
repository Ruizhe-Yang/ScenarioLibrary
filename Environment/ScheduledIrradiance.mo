within ScenarioLibrary.Environment;
block ScheduledIrradiance "Repeated light intervals with linear irradiance transitions"
  parameter Modelica.Units.SI.Time startTime = 0 "Start of the first light interval";
  parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 120 "Positive repetition period";
  parameter Modelica.Units.SI.Time lightTime(min=Modelica.Constants.small) = 75 "Duration of each light interval";
  parameter Modelica.Units.SI.Time transitionTime(min=Modelica.Constants.small) = 2 "Positive duration of each irradiance rise or fall";
  parameter Real fullIrradiance(unit="W/m2",min=0) = 1000 "Nonnegative irradiance reached at full illumination";
  Modelica.Blocks.Interfaces.RealOutput irradiance(unit="W/m2")  "Scheduled irradiance" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.BooleanOutput illuminated  "True within the scheduled half-open light interval" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
protected
  Modelica.Units.SI.Time localTime "Time within the repeated illumination cycle";
  Real weight "Unit irradiance multiplier";
initial equation
  assert(period>0 and lightTime<=period and transitionTime>0 and 2*transitionTime<=lightTime and fullIrradiance>=0,
    "Invalid illumination schedule.");
equation
  localTime = if time >= startTime then mod(time-startTime,period) else lightTime;
  weight = min(1,max(0,min(localTime,lightTime-localTime)/transitionTime));
  irradiance = fullIrradiance*weight;
  illuminated = time >= startTime and localTime < lightTime;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-44.75,28.25},{-25.25,47.75}}, lineColor={191,0,0}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-21.35,38},{-15.5,38}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-25.348,47.652},{-21.2114,51.7886}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-35,51.65},{-35,57.5}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-44.652,47.652},{-48.7886,51.7886}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-48.65,38},{-54.5,38}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-44.652,28.348},{-48.7886,24.2114}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-35,24.35},{-35,18.5}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-25.348,28.348},{-21.2114,24.2114}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-62,-36},{-38,-36},{-22,14},{17,14},{32,-36},{62,-36}}, color={191,0,0}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{4,63},{64,36}}, textString="E(t)", textColor={191,0,0}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Repeat a light interval of duration <code>lightTime</code> every <code>period</code>, beginning at <code>startTime</code>. Irradiance rises linearly over <code>transitionTime</code>, holds at <code>fullIrradiance</code> when a plateau is available, and falls linearly over the final transition.</p><p>The light interval must fit within the period and contain both positive-duration transitions. <code>illuminated</code> marks the half-open light interval independently of irradiance magnitude, so it is true at the interval start while irradiance is still zero. Both outputs are inactive before startTime.</p></html>"));
end ScheduledIrradiance;
