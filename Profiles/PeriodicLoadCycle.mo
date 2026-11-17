within ScenarioLibrary.Profiles;
block PeriodicLoadCycle "Finite repetition of a complete load table"
  parameter Integer n(min=2) = 3 "Number of nodes in one load period";
  parameter Integer cycles(min=1) = 3 "Number of scheduled periods";
  parameter Modelica.Units.SI.Time startTime = 0 "Absolute start of the first load cycle";
  parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 2 "Positive repetition period";
  parameter Real points[n,2] = [0,0;period/2,1;period,0] "Local time and command pairs spanning exactly one period";
  parameter Real standby = 0 "Output outside the finite sequence";
  Modelica.Blocks.Interfaces.RealOutput y "Interpolated load command" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.IntegerOutput cycle "One-based active cycle index, or zero outside the sequence" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
protected
  Boolean active "The finite profile sequence is active";
  Modelica.Blocks.Tables.CombiTable1Ds table(table=points,columns={2},smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) "Linear interpolation of the local profile table";
initial equation
  assert(n >= 2 and cycles >= 1 and period > 0, "Invalid number or period of load cycles.");
  assert(abs(points[1,1]) <= 1e-12*period and abs(points[n,1]-period) <= 1e-12*period and
    min(points[2:n,1]-points[1:n-1,1]) > 0, "Cycle points must span exactly one period.");
equation
  active = time >= startTime and time < startTime+cycles*period;
  cycle = if active then 1+integer(floor((time-startTime)/period)) else 0;
  table.u = if active then mod(time-startTime,period) else 0;
  y = if active then table.y[1] else standby;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-28},{-40,35},{-22,5},{-4,-28},{14,35},{32,5},{50,-28},{64,-28}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,73},{66,48}}, textString="n cycles", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="PeriodicLoadCycle")}),
    Documentation(info="<html><p>Play a linearly interpolated table during <code>[startTime,startTime+cycles*period)</code>. The first table time must be zero, the last must equal <code>period</code>, and intermediate times must increase strictly. All timing uses absolute simulation time.</p><p>The modulus resets the table input at every period boundary. <code>cycle</code> is one-based while active and zero outside the sequence; <code>y</code> is <code>standby</code> outside it.</p></html>"));
end PeriodicLoadCycle;
