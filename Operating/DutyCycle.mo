within ScenarioLibrary.Operating;
block DutyCycle "Finite schedule of running and idle intervals"
  parameter Modelica.Units.SI.Time startTime = 0 "Absolute start of the first duty period";
  parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 5 "Positive repetition period";
  parameter Real duty(min=0,max=1) = 0.5 "Fraction of each period assigned to running";
  parameter Integer cycles(min=1) = 3 "Number of scheduled periods";
  Modelica.Blocks.Interfaces.BooleanOutput running "The current instant belongs to a scheduled running interval" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.BooleanOutput completed "The final scheduled period has ended" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
initial equation
  assert(period > 0 and duty >= 0 and duty <= 1 and cycles >= 1, "Invalid duty schedule.");
equation
  completed = time >= startTime+period*cycles;
  running = time >= startTime and not completed and mod(time-startTime,period) < duty*period;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,30},{-35,30},{-35,-30},{-15,-30},{-15,30},{8,30},{8,-30},{28,-30},{28,30},{51,30},{51,-30},{64,-30}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,73},{66,48}}, textString="D", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="DutyCycle")}),
    Documentation(info="<html><p>Set <code>running</code> during the first <code>duty*period</code> seconds of each scheduled period. Periods begin at the absolute <code>startTime</code> and repeat <code>cycles</code> times using half-open intervals.</p><p><code>completed</code> becomes true at the end of the last period. A zero duty gives no running interval; unit duty keeps running true throughout the scheduled sequence.</p></html>"));
end DutyCycle;
