within ScenarioLibrary.Timing;
block PhaseScheduler "Consecutive phases defined by positive durations"
  parameter Integer n(min=1) = 3 "Number of consecutive phases";
  parameter Modelica.Units.SI.Time startTime = 0 "Inclusive start of the absolute schedule";
  parameter Modelica.Units.SI.Time durations[n](each min=Modelica.Constants.small) = fill(2,n) "Positive phase durations";
  Modelica.Blocks.Interfaces.IntegerOutput phase "Current phase index, or zero outside the schedule" annotation(Placement(transformation(extent={{94,66},{106,78}}), iconTransformation(extent={{94,66},{106,78}})));
  Modelica.Blocks.Interfaces.BooleanOutput completed "True once the scheduled end has been reached" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.RealOutput elapsed(unit="s") "Elapsed time within the current phase, or zero" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
  Modelica.Blocks.Interfaces.RealOutput remaining(unit="s") "Time remaining in the current phase, or zero" annotation(Placement(transformation(extent={{94,-78},{106,-66}}), iconTransformation(extent={{94,-78},{106,-66}})));
protected
  final parameter Modelica.Units.SI.Time ends[n] = {startTime+sum(durations[1:i]) for i in 1:n} "Absolute phase end times";
  Integer passed "Number of phase ends reached";
initial equation
  assert(n >= 1 and min(durations) > 0, "All mission phases must have positive duration.");
equation
  passed = sum({if time >= ends[i] then 1 else 0 for i in 1:n});
  completed = passed == n;
  phase = if time < startTime or completed then 0 else passed+1;
  elapsed = if phase == 0 then 0 elseif phase == 1 then time-startTime else time-ends[phase-1];
  remaining = if phase > 0 then ends[phase]-time else 0;
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
        Line(points={{-60,50},{60,50}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="PhaseScheduler")}),
    Documentation(info="<html><p>Build consecutive phases from <code>startTime</code> and the positive entries of <code>durations</code>. The active phase includes its start and excludes its end. <code>elapsed</code> and <code>remaining</code> report the current phase timing.</p><p><code>phase</code>, <code>elapsed</code> and <code>remaining</code> are zero before the first phase and after the final phase. <code>completed</code> becomes true at the final end time. This is an absolute schedule with no pause or restart input.</p></html>"));
end PhaseScheduler;
