within ScenarioLibrary.Operating;
block MultiModeSchedule "Duration-based mode and load-fraction schedule"
  parameter Integer n(min=1) = 4 "Number of operating phases";
  parameter Modelica.Units.SI.Time startTime = 0 "Absolute start of the first phase";
  parameter Modelica.Units.SI.Time durations[n](each min=Modelica.Constants.small) = fill(2,n) "Positive durations of the consecutive phases";
  parameter ScenarioLibrary.Utilities.Types.OperatingMode modes[n] = {ScenarioLibrary.Utilities.Types.OperatingMode.Startup,ScenarioLibrary.Utilities.Types.OperatingMode.Rated,ScenarioLibrary.Utilities.Types.OperatingMode.PartLoad,ScenarioLibrary.Utilities.Types.OperatingMode.Shutdown} "Operating mode selected in each phase";
  parameter Real loadFraction[n](each min=0,each max=1) = {0.3,1,0.6,0} "Planned demand fraction in each phase";
  Modelica.Blocks.Interfaces.IntegerOutput phase "One-based active phase index, or zero outside the schedule" annotation(Placement(transformation(extent={{94,42},{106,54}}), iconTransformation(extent={{94,42},{106,54}})));
  Modelica.Blocks.Interfaces.RealOutput demand "Load fraction in the active phase, or zero outside it" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
  Modelica.Blocks.Interfaces.BooleanOutput completed "The last scheduled phase has ended" annotation(Placement(transformation(extent={{94,-54},{106,-42}}), iconTransformation(extent={{94,-54},{106,-42}})));
  output ScenarioLibrary.Utilities.Types.OperatingMode mode "Operating mode for the current phase or schedule state";
protected
  ScenarioLibrary.Timing.PhaseScheduler scheduler(n=n,startTime=startTime,durations=durations) "Duration-based phase scheduler";
initial equation
  assert(min(loadFraction) >= 0 and max(loadFraction) <= 1, "Mode fractions must be in [0,1].");
equation
  phase = scheduler.phase;
  completed = scheduler.completed;
  mode = if phase > 0 then modes[phase] elseif completed then ScenarioLibrary.Utilities.Types.OperatingMode.Off else ScenarioLibrary.Utilities.Types.OperatingMode.Standby;
  demand = if phase > 0 then loadFraction[phase] else 0;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-67,-30},{67,-30}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Rectangle(extent={{-60,-26},{-28,26}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-16,-26},{16,26}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{28,-26},{60,26}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Text(extent={{-60,-23},{-28,23}}, textString="1", textColor={0,0,127}, fontSize=0),
        Text(extent={{-16,-23},{16,23}}, textString="2", textColor={0,0,127}, fontSize=0),
        Text(extent={{28,-23},{60,23}}, textString="3", textColor={0,0,127}, fontSize=0),
        Line(points={{-60,45},{-24,45},{-24,65},{18,65},{18,45},{60,45}}, color={0,0,127}, thickness=1.1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="MultiModeSchedule")}),
    Documentation(info="<html><p>Use positive <code>durations</code> to form consecutive half-open phases from <code>startTime</code>. During phase <code>i</code>, output <code>modes[i]</code> and <code>loadFraction[i]</code>, with the one-based index on <code>phase</code>.</p><p>Before the schedule, the mode is Standby; after completion it is Off. Outside the active phases, <code>phase</code> and <code>demand</code> are zero. Each load fraction must lie in [0,1].</p></html>"));
end MultiModeSchedule;
