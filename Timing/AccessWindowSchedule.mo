within ScenarioLibrary.Timing;
block AccessWindowSchedule "Ordered access windows with advance preparation"
  parameter Integer n(min=1) = 2 "Number of access windows";
  parameter Modelica.Units.SI.Time starts[n] = {2,8} "Ordered window start times";
  parameter Modelica.Units.SI.Time ends[n] = {4,10} "Corresponding exclusive window end times";
  parameter Modelica.Units.SI.Time leadTime(min=0) = 0.5 "Advance preparation interval";
  Modelica.Blocks.Interfaces.IntegerOutput activeIndex "Index of the active access window, or zero" annotation(Placement(transformation(extent={{94,66},{106,78}}), iconTransformation(extent={{94,66},{106,78}})));
  Modelica.Blocks.Interfaces.BooleanOutput preparing "True outside access windows within leadTime of a future start" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.BooleanOutput hasNext  "True when a strictly future window start remains" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
  Modelica.Blocks.Interfaces.RealOutput timeToNext(unit="s")  "Time to the next strictly future start, or zero" annotation(Placement(transformation(extent={{94,-78},{106,-66}}), iconTransformation(extent={{94,-78},{106,-66}})));
protected
  Modelica.Units.SI.Time nextStart "Next strictly future window start";
initial equation
  assert(n>=1 and min(ends-starts)>0 and leadTime>=0,"Invalid access windows.");
  for i in 2:n loop
    assert(starts[i]>=ends[i-1],"Access windows must be ordered and disjoint.");
  end for;
equation
  activeIndex = sum({if time>=starts[i] and time<ends[i] then i else 0 for i in 1:n});
  hasNext = time < starts[n];
  nextStart = min({if time < starts[i] then starts[i] else Modelica.Constants.inf for i in 1:n});
  timeToNext = if hasNext then nextStart-time else 0;
  preparing = activeIndex==0 and hasNext and timeToNext<=leadTime;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-66,-37},{66,-37}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Rectangle(extent={{-48,-37},{-13,24}}, lineColor={128,128,128}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{22,-37},{57,24}}, lineColor={128,128,128}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-66,-37},{-59,-37},{-59,9},{-49,9}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-13,-37},{10,-37},{10,9},{21,9}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{48,-43},{70,-64}}, textString="t", textColor={128,128,128}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Evaluate positive-duration, ordered and non-overlapping intervals <code>[starts[i],ends[i])</code>. <code>activeIndex</code> is the active interval index, or zero outside every interval. Adjacent intervals may share a boundary.</p><p><code>hasNext</code> identifies a strictly future start and <code>timeToNext</code> gives the time to that start, or zero when none remains. <code>preparing</code> is true only outside an active window and within <code>leadTime</code> of the next start. At a window start, the next-start calculation moves to the following window.</p></html>"));
end AccessWindowSchedule;
