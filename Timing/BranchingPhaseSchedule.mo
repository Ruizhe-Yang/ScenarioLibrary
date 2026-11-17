within ScenarioLibrary.Timing;
block BranchingPhaseSchedule "Single-branch phase schedule with a boundary-sampled decision"
  parameter Integer n(min=3) = 4 "Number of scheduled phases";
  parameter Modelica.Units.SI.Time startTime = 0 "Inclusive start of the absolute schedule";
  parameter Modelica.Units.SI.Time durations[n](each min=Modelica.Constants.small) = fill(2,n) "Positive phase durations";
  parameter Integer branchFrom(min=1,max=n-2) = 2 "Phase whose end samples the jump request";
  parameter Integer branchTo(min=branchFrom+2,max=n) = 4 "Phase entered when the jump is accepted";
  Modelica.Blocks.Interfaces.BooleanInput jumpRequested "Planned jump request sampled at the selected boundary" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Interfaces.IntegerOutput phase "Scheduled phase index, or zero outside the mission" annotation(Placement(transformation(extent={{94,66},{106,78}}), iconTransformation(extent={{94,66},{106,78}})));
  Modelica.Blocks.Interfaces.BooleanOutput jumped(start=false,fixed=true)  "Retained jump decision" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.BooleanOutput completed  "True once the scheduled end has been reached" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
  Modelica.Blocks.Interfaces.RealOutput elapsed(unit="s") "Elapsed time within the current phase" annotation(Placement(transformation(extent={{94,-78},{106,-66}}), iconTransformation(extent={{94,-78},{106,-66}})));
protected
  final parameter Modelica.Units.SI.Time ends[n] = {startTime+sum(durations[1:i]) for i in 1:n} "Absolute end times before any phase skip";
  final parameter Modelica.Units.SI.Time skipDuration = sum(durations[branchFrom+1:branchTo-1]) "Duration removed by the accepted jump";
  Modelica.Units.SI.Time effectiveTime "Absolute time advanced by the skipped duration";
  Integer passed "Number of phase ends reached on the effective timeline";
initial equation
  assert(n>=3 and min(durations)>0 and branchFrom>=1 and branchTo>=branchFrom+2 and branchTo<=n,"Invalid branch schedule.");
equation
  when {initial(),time>=ends[branchFrom]} then
    jumped = time>=ends[branchFrom] and jumpRequested;
  end when;
  effectiveTime = time+(if jumped then skipDuration else 0);
  passed = sum({if effectiveTime>=ends[i] then 1 else 0 for i in 1:n});
  completed = passed==n;
  phase = if time<startTime or completed then 0 else passed+1;
  elapsed = if phase==0 then 0 elseif phase==1 then effectiveTime-startTime else effectiveTime-ends[phase-1];
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-67,-37},{67,-37}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Rectangle(extent={{-60,-33},{-28,19}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-16,-33},{16,19}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{28,-33},{60,19}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Text(extent={{-60,-30},{-28,16}}, textString="1", textColor={0,0,127}, fontSize=0),
        Text(extent={{-16,-30},{16,16}}, textString="2", textColor={0,0,127}, fontSize=0),
        Text(extent={{28,-30},{60,16}}, textString="3", textColor={0,0,127}, fontSize=0),
        Line(points={{-44,27},{-44,63},{44,63},{44,27}}, color={0,0,127}, thickness=1, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Build consecutive positive-duration phases from <code>startTime</code>. At the end of <code>branchFrom</code>, sample <code>jumpRequested</code> once. A true decision skips the intervening phases and continues at <code>branchTo</code>, shortening the remaining schedule by their total duration. <code>jumped</code> retains the decision.</p><p><code>phase</code> is zero before the schedule and after completion; otherwise it identifies the current stage. <code>elapsed</code> is local to that stage and returns to zero outside the schedule. If simulation initialisation occurs at or beyond the decision boundary, the request is sampled at initialisation.</p></html>"));
end BranchingPhaseSchedule;
