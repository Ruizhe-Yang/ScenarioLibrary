within ScenarioLibrary.Profiles;
block StartupHoldShutdown "Linear start-up, hold and shutdown demand"
  parameter Modelica.Units.SI.Time startTime = 1 "Absolute start of the demand sequence";
  parameter Modelica.Units.SI.Time riseTime(min=Modelica.Constants.small) = 2 "Positive duration of the linear rise";
  parameter Modelica.Units.SI.Time holdTime(min=0) = 5 "Duration of the constant rated demand";
  parameter Modelica.Units.SI.Time fallTime(min=Modelica.Constants.small) = 2 "Positive duration of the linear fall";
  parameter Real standby = 0 "Demand outside the running portion";
  parameter Real rated = 1 "Demand during the hold portion";
  Modelica.Blocks.Interfaces.RealOutput y "Prescribed output signal" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
protected
  Real fraction "Normalised demand relative to standby and rated values";
  Modelica.Units.SI.Time elapsed "Elapsed time since the sequence start";
initial equation
  assert(riseTime > 0 and holdTime >= 0 and fallTime > 0, "Invalid startup or shutdown durations.");
equation
  elapsed = time-startTime;
  fraction = if elapsed < 0 then 0
    elseif elapsed < riseTime then elapsed/riseTime
    elseif elapsed < riseTime+holdTime then 1
    else max(0,1-(elapsed-riseTime-holdTime)/fallTime);
  y = standby+(rated-standby)*fraction;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-30},{-40,-30},{-15,36},{21,36},{45,-30},{64,-30}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="StartupHoldShutdown")}),
    Documentation(info="<html><p>Move from <code>standby</code> to <code>rated</code> over <code>riseTime</code>, hold for <code>holdTime</code>, then return over <code>fallTime</code>. The sequence starts at the absolute <code>startTime</code>; standby applies before it and after shutdown.</p><p>Rise and fall durations must be positive; the hold may be zero. The output is a prescribed demand signal and does not measure plant start-up or shutdown completion.</p></html>"));
end StartupHoldShutdown;
