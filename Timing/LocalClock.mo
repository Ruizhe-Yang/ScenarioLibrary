within ScenarioLibrary.Timing;
block LocalClock "Local elapsed time with optional restart input"
parameter Boolean useStartInput=false "Select the optional start input";
  parameter Boolean retrigger=true "Restart on subsequent rising start requests";
  parameter Modelica.Units.SI.Time referenceTime=0 "Absolute clock origin when no start input is used";
  parameter Modelica.Units.SI.Time stopTime=Modelica.Constants.inf "Absolute simulation time used to cap the clock";
    Modelica.Blocks.Interfaces.BooleanInput start if useStartInput  "Rising request to start or restart the local clock" annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput started  "True after the selected clock origin has been established" annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput elapsed(unit="s")  "Nonnegative elapsed time from the selected origin" annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
protected
  Modelica.Blocks.Interfaces.BooleanInput request  "Bound start request" annotation(Placement(transformation(origin={0,100},extent={{-10,-10},{10,10}}),iconTransformation(origin={0,100},extent={{-10,-10},{10,10}})));
  discrete Boolean seen(start=false,fixed=true) "A start request has been accepted";
  discrete Modelica.Units.SI.Time t0(start=0,fixed=true) "Simulation time of the accepted clock origin";
equation
  connect(start,request);
  if not useStartInput then request=false; end if;
  when {initial(),request} then
    seen=if initial() then request else true;
    t0=if initial() or not pre(seen) or retrigger then time else pre(t0);
  end when;
  started=if useStartInput then seen else time>=referenceTime;
  elapsed=if started then max(0,min(time,stopTime)-(if useStartInput then t0 else referenceTime)) else 0;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-43,-35},{43,51}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{0,43},{0,49}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,8},{0,34},{0,8}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,8},{23,-5}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-62,-38},{-48,-38},{-48,-58},{-23,-58}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Without <code>useStartInput</code>, report elapsed simulation time from <code>referenceTime</code>, with zero output beforehand. With the start input enabled, the first rising request establishes the origin and latches <code>started</code>. Further rising requests reset the origin when <code>retrigger=true</code>.</p><p>A falling start signal does not pause or clear the clock. <code>stopTime</code> caps the absolute simulation time used in the elapsed-time calculation, and the result is bounded below by zero. It is not a duration measured from each trigger.</p></html>"));
end LocalClock;
