within ScenarioLibrary.Timing;
block MissionClock "Pauseable mission clock with a bounded reported duration"
  parameter Modelica.Units.SI.Time startTime = 0 "Earliest simulation time at which accumulation is allowed";
  parameter Modelica.Units.SI.Time duration(min=Modelica.Constants.small) = 8 "Maximum reported mission duration";
  parameter Real speed(min=Modelica.Constants.small) = 1 "Mission-time rate per unit simulation time";
  Modelica.Blocks.Interfaces.BooleanInput enable "Permit mission-time accumulation" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Interfaces.RealOutput elapsed(unit="s") "Accumulated mission time limited to duration" annotation(Placement(transformation(extent={{94,42},{106,54}}), iconTransformation(extent={{94,42},{106,54}})));
  Modelica.Blocks.Interfaces.BooleanOutput running "True while enabled before mission completion" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
  Modelica.Blocks.Interfaces.BooleanOutput completed "True once accumulated mission time reaches duration" annotation(Placement(transformation(extent={{94,-54},{106,-42}}), iconTransformation(extent={{94,-54},{106,-42}})));
protected
  Modelica.Units.SI.Time accumulated(start=0,fixed=true) "Internal mission time, including accumulation beyond duration";
initial equation
  assert(duration > 0 and speed > 0, "Mission clock duration and speed must be positive.");
equation
  der(accumulated) = if time >= startTime and enable then speed else 0;
  elapsed = min(duration,max(0,accumulated));
  completed = accumulated >= duration;
  running = enable and time >= startTime and not completed;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-43,-35},{43,51}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{0,43},{0,49}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,8},{0,34},{0,8}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,8},{23,-5}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Rectangle(extent={{42,-59},{49,-30}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{57,-59},{64,-30}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="MissionClock")}),
    Documentation(info="<html><p>Accumulate local mission time at <code>speed</code> mission seconds per simulation second while <code>enable</code> is true and <code>time&gt;=startTime</code>. Disabling the input pauses accumulation and enabling it resumes from the retained value.</p><p><code>elapsed</code> is limited to <code>duration</code>; <code>completed</code> becomes true when that duration is reached and <code>running</code> becomes false. The internal accumulated state continues to integrate when enabled after completion. There is no reset or restart input.</p></html>"));
end MissionClock;
