within ScenarioLibrary.Timing;
block LocalClock "Explicit local time with optional repeated startup"
parameter Boolean useStartInput=false;
  parameter Boolean retrigger=true;
  parameter Modelica.Units.SI.Time referenceTime=0;
  parameter Modelica.Units.SI.Time stopTime=Modelica.Constants.inf "Optional hold time for the clock";
    Modelica.Blocks.Interfaces.BooleanInput start if useStartInput annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput started annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput elapsed(unit="s") annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
protected
  Modelica.Blocks.Interfaces.BooleanInput request annotation(Placement(transformation(origin={0,100},extent={{-10,-10},{10,10}}),iconTransformation(origin={0,100},extent={{-10,-10},{10,10}})));
  discrete Boolean seen(start=false,fixed=true);
  discrete Modelica.Units.SI.Time t0(start=0,fixed=true);
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
    Documentation(info="<html><p><b>Purpose</b> Explicit local time with optional repeated startup.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.BooleanInput start if useStartInput; Modelica.Blocks.Interfaces.BooleanOutput started; Modelica.Blocks.Interfaces.RealOutput elapsed(unit=\"s\")</p><p><b>Parameters</b> parameter Boolean useStartInput=false; parameter Boolean retrigger=true; parameter Modelica.Units.SI.Time referenceTime=0; parameter Modelica.Units.SI.Time stopTime=Modelica.Constants.inf \"Optional hold time for the clock\"</p><p><b>Behavior</b> Explicit local time with optional repeated startup</p><p><b>Initialization</b> The declared start values and initialization equations apply.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> started, elapsed</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.PhaseQualifiedWindows\">ScenarioLibrary.Examples.PhaseQualifiedWindows</a></p></html>"));
end LocalClock;
