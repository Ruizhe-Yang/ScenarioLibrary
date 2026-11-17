within ScenarioLibrary.Operating;
block ReversibleFlowDemand "Finite sinusoidal mass-flow demand about a mean value"
  parameter Modelica.Units.SI.Time startTime = 0 "Absolute start of the sinusoidal sequence";
  parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small) = 2 "Positive repetition period";
  parameter Integer cycles(min=1) = 2 "Number of scheduled periods";
  parameter Modelica.Units.SI.MassFlowRate amplitude(min=0) = 0.02 "Nonnegative oscillating mass-flow amplitude";
  parameter Modelica.Units.SI.MassFlowRate meanFlow = 0 "Mean flow and output outside the sequence";
  Modelica.Blocks.Interfaces.RealOutput requestedFlow(unit="kg/s")  "Prescribed signed mass-flow demand" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.BooleanOutput running  "The finite sinusoidal sequence is active" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
initial equation
  assert(period>0 and cycles>=1 and amplitude>=0,"Invalid flow demand settings.");
equation
  running = time >= startTime and time < startTime+cycles*period;
  requestedFlow = meanFlow+(if running then amplitude*sin(2*Modelica.Constants.pi*(time-startTime)/period) else 0);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,0},{65,0}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,0},{-55.273,9.579},{-52.545,18.382},{-49.818,25.695},{-47.091,30.927},{-44.364,33.654},{-41.636,33.654},{-38.909,30.927},{-36.182,25.695},{-33.455,18.382},{-30.727,9.579},{-28,0},{-25.273,-9.579},{-22.545,-18.382},{-19.818,-25.695},{-17.091,-30.927},{-14.364,-33.654},{-11.636,-33.654},{-8.909,-30.927},{-6.182,-25.695},{-3.455,-18.382},{-0.727,-9.579},{2,0},{4.727,9.579},{7.455,18.382},{10.182,25.695},{12.909,30.927},{15.636,33.654},{18.364,33.654},{21.091,30.927},{23.818,25.695},{26.545,18.382},{29.273,9.579},{32,0},{34.727,-9.579},{37.455,-18.382},{40.182,-25.695},{42.909,-30.927},{45.636,-33.654},{48.364,-33.654},{51.091,-30.927},{53.818,-25.695},{56.545,-18.382},{59.273,-9.579},{62,0}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-45,70},{60,48}}, textString="q(t)", textColor={0,0,127}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Add a sinusoid of the configured amplitude to <code>meanFlow</code> during <code>cycles</code> complete periods from <code>startTime</code>. Outside the half-open sequence, the requested flow equals <code>meanFlow</code>.</p><p>The value is continuous at the sequence boundaries, although its slope may jump. <code>running</code> identifies the scheduled interval. Flow reverses only when the chosen mean and amplitude make the command cross zero.</p></html>"));
end ReversibleFlowDemand;
