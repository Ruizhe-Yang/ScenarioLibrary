within ScenarioLibrary.Timing;
block DwellTrigger "Qualify a continuous dwell and count each occurrence"
parameter Modelica.Units.SI.Time dwellTime(min=0)=0.3 "Required continuously true interval";
    Modelica.Blocks.Interfaces.BooleanInput condition  "Condition that must remain true" annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput fired  "True after qualification until the condition becomes false" annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.IntegerOutput count(start=0,fixed=true)  "Number of qualified continuous dwell intervals" annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
protected
  discrete Modelica.Units.SI.Time began(start=0,fixed=true) "Start time of the current true interval";
initial equation
  assert(dwellTime>=0,"Negative dwell time.");
equation
  when {initial(),condition} then began=time; end when;
  fired=condition and time>=began+dwellTime;
  when {initial(),fired} then count=(if initial() then 0 else pre(count))+(if fired then 1 else 0); end when;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-64,-26},{-43,-26},{-43,24},{61,24}}, color={128,0,128}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{-43,49},{14,49}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.Filled,Arrow.Filled}),
        Line(points={{14,-52},{14,-7},{31,-7},{31,-52},{62,-52}}, color={128,0,128}, thickness=1.1, pattern=LinePattern.Solid),
        Text(extent={{-25,73},{6,53}}, textString="dt", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Start a new dwell interval when <code>condition</code> becomes true. <code>fired</code> becomes true after the condition has remained true for <code>dwellTime</code> and remains true until the condition becomes false. Each qualifying interval increments <code>count</code> once.</p><p>Initialisation starts timing from the simulation start. An initially true condition with zero dwell time qualifies immediately and counts as one occurrence. A false interval clears the qualification, so a subsequent true condition must satisfy a fresh dwell.</p></html>"));
end DwellTrigger;
