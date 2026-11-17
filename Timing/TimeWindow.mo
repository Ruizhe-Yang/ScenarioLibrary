within ScenarioLibrary.Timing;
block TimeWindow "Absolute half-open time window"
parameter Modelica.Units.SI.Time startTime=1 "Inclusive start of the absolute window";
  parameter Modelica.Units.SI.Time endTime=3 "Exclusive end of the absolute window";
    Modelica.Blocks.Interfaces.BooleanOutput active  "True inside the half-open window" annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput completed  "True at and after endTime" annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
initial equation
  assert(endTime>=startTime,"Reversed window.");
equation
  active=time>=startTime and time<endTime;
  completed=time>=endTime;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-63,-31},{-32,-31},{-32,34},{35,34},{35,-31},{64,-31}}, color={128,0,128}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-32,-49},{-32,54}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Dash),
        Line(points={{35,-49},{35,54}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Dash),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Set <code>active</code> on <code>[startTime,endTime)</code> and set <code>completed</code> at or after <code>endTime</code>. The end must not precede the start.</p><p>Equal start and end times define an empty active window; completion still becomes true at that instant.</p></html>"));
end TimeWindow;
