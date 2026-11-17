within ScenarioLibrary.Timing;
block MissionLifecycle "Event-driven mission state with pause, recovery and restart"
  Modelica.Blocks.Interfaces.BooleanInput start "Rising request to start an accepted new run" annotation(Placement(transformation(extent={{-106,76},{-94,88}}), iconTransformation(extent={{-106,76},{-94,88}})));
  Modelica.Blocks.Interfaces.BooleanInput pause "Rising request to pause a running mission" annotation(Placement(transformation(extent={{-106,43},{-94,55}}), iconTransformation(extent={{-106,43},{-94,55}})));
  Modelica.Blocks.Interfaces.BooleanInput resume "Rising request to resume a paused mission" annotation(Placement(transformation(extent={{-106,10},{-94,22}}), iconTransformation(extent={{-106,10},{-94,22}})));
  Modelica.Blocks.Interfaces.BooleanInput abort "Rising request to abort a running or paused mission" annotation(Placement(transformation(extent={{-106,-22},{-94,-10}}), iconTransformation(extent={{-106,-22},{-94,-10}})));
  Modelica.Blocks.Interfaces.BooleanInput complete "External completion request" annotation(Placement(transformation(extent={{-106,-55},{-94,-43}}), iconTransformation(extent={{-106,-55},{-94,-43}})));
  Modelica.Blocks.Interfaces.BooleanInput recover "Request recovery preparation after abort" annotation(Placement(transformation(extent={{-106,-88},{-94,-76}}), iconTransformation(extent={{-106,-88},{-94,-76}})));
  output ScenarioLibrary.Utilities.Types.MissionState state "Current declared mission lifecycle state";
  Modelica.Blocks.Interfaces.BooleanOutput running  "True only in the Running state" annotation(Placement(transformation(extent={{94,42},{106,54}}), iconTransformation(extent={{94,42},{106,54}})));
  Modelica.Blocks.Interfaces.IntegerOutput runCount(start=0,fixed=true)  "Number of accepted mission starts" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
  Modelica.Blocks.Interfaces.RealOutput elapsedActive(unit="s")  "Active time accumulated during the current run" annotation(Placement(transformation(extent={{94,-54},{106,-42}}), iconTransformation(extent={{94,-54},{106,-42}})));
protected
  Modelica.Units.SI.Time totalActive(start=0,fixed=true) "Active time accumulated across all runs";
  discrete Modelica.Units.SI.Time elapsedAtStart(start=0,fixed=true) "Total active time at the latest accepted start";
equation
  running = state==ScenarioLibrary.Utilities.Types.MissionState.Running;
  der(totalActive) = if running then 1 else 0;
  when {initial(),change(runCount)} then
    elapsedAtStart = totalActive;
  end when;
  elapsedActive = totalActive-elapsedAtStart;
algorithm
  when initial() then
    state := if start and not abort then ScenarioLibrary.Utilities.Types.MissionState.Running else ScenarioLibrary.Utilities.Types.MissionState.Idle;
    runCount := if start and not abort then 1 else 0;
  elsewhen abort then
    state := if pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Running or pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Paused then ScenarioLibrary.Utilities.Types.MissionState.Aborted else pre(state);
  elsewhen complete then
    state := if pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Running or pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Paused then ScenarioLibrary.Utilities.Types.MissionState.Completed else pre(state);
  elsewhen pause then
    state := if pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Running then ScenarioLibrary.Utilities.Types.MissionState.Paused else pre(state);
  elsewhen recover then
    state := if pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Aborted then ScenarioLibrary.Utilities.Types.MissionState.Recovery else pre(state);
  elsewhen resume then
    state := if pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Paused and not abort then ScenarioLibrary.Utilities.Types.MissionState.Running else pre(state);
  elsewhen start then
    if not abort and (pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Idle or pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Completed or pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Recovery) then
      state := ScenarioLibrary.Utilities.Types.MissionState.Running;
      runCount := pre(runCount)+1;
    end if;
  end when;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-60,12},{-18,46}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Polygon(points={{-49,20},{-49,38},{-32,29},{-49,20}}, lineColor={75,138,73}, fillColor={75,138,73}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Rectangle(extent={{17,12},{59,46}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{29,20},{29,38}}, color={64,64,64}, thickness=1.5, pattern=LinePattern.Solid),
        Line(points={{45,20},{45,38}}, color={64,64,64}, thickness=1.5, pattern=LinePattern.Solid),
        Rectangle(extent={{-20,-48},{20,-14}}, lineColor={64,64,64}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-17,29},{15,29}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{38,10},{38,-30},{21,-30}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{-21,-30},{-40,-30},{-40,10}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Use external rising event signals to manage <code>Idle</code>, <code>Running</code>, <code>Paused</code>, <code>Completed</code>, <code>Aborted</code> and <code>Recovery</code>. Pause is accepted only while Running; completion and abort are accepted while Running or Paused. Recovery moves an aborted mission to preparation; a new start is accepted from Idle, Completed or Recovery.</p><p>At simultaneous events, the algorithm selects abort, complete, pause, recover, resume and start in that order, even if the selected branch leaves the state unchanged. Initialisation is separate: an initially true start with no abort enters Running, otherwise the initial state is Idle.</p><p><code>runCount</code> counts accepted starts, including an initial start. <code>elapsedActive</code> accumulates only while Running, holds during a pause or after termination, and resets on an accepted new run. Completion is an external declaration, not a check of plant performance.</p></html>"));
end MissionLifecycle;
