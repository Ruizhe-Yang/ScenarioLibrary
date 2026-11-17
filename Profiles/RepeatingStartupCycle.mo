within ScenarioLibrary.Profiles;
block RepeatingStartupCycle "Repeated start-up, hold, shutdown and idle sequence"
  parameter Integer cycles(min=1) = 3 "Number of scheduled periods";
  parameter Modelica.Units.SI.Time startTime = 0 "Absolute start of the first period";
  parameter Modelica.Units.SI.Time riseTime(min=Modelica.Constants.small) = 1 "Positive duration of the linear rise";
  parameter Modelica.Units.SI.Time holdTime(min=0) = 2 "Duration of the constant rated demand";
  parameter Modelica.Units.SI.Time fallTime(min=Modelica.Constants.small) = 1 "Positive duration of the linear fall";
  parameter Modelica.Units.SI.Time idleTime(min=0) = 1 "Standby duration at the end of each period";
  parameter Real standby = 0 "Demand outside the running portion";
  parameter Real rated = 1 "Demand during the hold portion";
  final parameter Modelica.Units.SI.Time period = riseTime+holdTime+fallTime+idleTime "Sum of rise, hold, fall and idle durations";
  Modelica.Blocks.Interfaces.RealOutput y  "Prescribed output signal" annotation(Placement(transformation(extent={{94,42},{106,54}}), iconTransformation(extent={{94,42},{106,54}})));
  Modelica.Blocks.Interfaces.IntegerOutput cycle "One-based period index including idle, or zero outside the sequence" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
  Modelica.Blocks.Interfaces.BooleanOutput completed  "The final scheduled period has ended" annotation(Placement(transformation(extent={{94,-54},{106,-42}}), iconTransformation(extent={{94,-54},{106,-42}})));
protected
  Modelica.Units.SI.Time localTime "Elapsed time within the active period";
  Real fraction "Normalised demand relative to standby and rated values";
initial equation
  assert(cycles>=1 and riseTime>0 and holdTime>=0 and fallTime>0 and idleTime>=0,"Invalid startup cycle.");
equation
  completed = time >= startTime+cycles*period;
  cycle = if time >= startTime and not completed then 1+integer(floor((time-startTime)/period)) else 0;
  localTime = if cycle>0 then time-startTime-(cycle-1)*period else 0;
  fraction = if cycle==0 then 0 elseif localTime<riseTime then localTime/riseTime
    elseif localTime<riseTime+holdTime then 1 else max(0,1-(localTime-riseTime-holdTime)/fallTime);
  y = standby+(rated-standby)*fraction;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-30},{-46,32},{-29,32},{-17,-30},{-7,-30},{5,32},{22,32},{34,-30},{64,-30}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,73},{66,48}}, textString="n cycles", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Repeat a linear rise from <code>standby</code> to <code>rated</code>, a hold, a linear fall and an idle interval. The period is the sum of these four durations. Timing is absolute and the number of periods is finite.</p><p><code>cycle</code> remains one-based throughout the active period, including its idle part. At <code>startTime+cycles*period</code>, <code>completed</code> becomes true, <code>cycle</code> returns to zero and <code>y</code> remains at standby.</p></html>"));
end RepeatingStartupCycle;
