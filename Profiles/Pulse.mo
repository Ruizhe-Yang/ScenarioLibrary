within ScenarioLibrary.Profiles;
block Pulse "Finite sequence of half-open pulses"
parameter Boolean useEnableInput=false "Use each enable edge as a local time origin";
  parameter Real baseline=0;

  parameter Real amplitude=1;
  parameter Modelica.Units.SI.Time startTime=0;
  parameter Modelica.Units.SI.Time width(min=Modelica.Constants.small)=0.2;
  parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small)=1;
  parameter Integer nCycles(min=1)=1;
  Modelica.Blocks.Interfaces.BooleanInput enable if useEnableInput annotation(Placement(transformation(origin={0,100},extent={{-10,-10},{10,10}}),iconTransformation(origin={0,100},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
protected
  Modelica.Blocks.Interfaces.BooleanInput enabled annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  discrete Modelica.Units.SI.Time origin(start=0,fixed=true);
  Modelica.Units.SI.Time tLocal;
initial equation
  assert(width>0 and period>=width and nCycles>=1,"Invalid pulse schedule.");
equation
  connect(enable,enabled);
  if not useEnableInput then enabled=true; end if;
  when {initial(),enabled} then origin=time; end when;
  tLocal=if useEnableInput then time-origin else time;
  y=if enabled then baseline+(if tLocal>=startTime and tLocal<startTime+nCycles*period and mod(tLocal-startTime,period)<width then amplitude else 0) else baseline;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-30},{-48,-30},{-48,31},{-25,31},{-25,-30},{-6,-30},{-6,31},{17,31},{17,-30},{37,-30},{37,31},{57,31},{57,-30},{64,-30}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Finite sequence of half-open pulses.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.BooleanInput enable if useEnableInput; Modelica.Blocks.Interfaces.RealOutput y</p><p><b>Parameters</b> parameter Boolean useEnableInput=false \"Use each enable edge as a local time origin\"; parameter Real baseline=0; parameter Real amplitude=1; parameter Modelica.Units.SI.Time startTime=0; parameter Modelica.Units.SI.Time width(min=Modelica.Constants.small)=0.2; parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small)=1; parameter Integer nCycles(min=1)=1</p><p><b>Behavior</b> Finite sequence of half-open pulses</p><p><b>Initialization</b> With external enable the first true value sets local time to zero.</p><p><b>Activation and recovery</b> Disable yields baseline and a later rising edge starts a new profile.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> y</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">ScenarioLibrary.Examples.MultiphaseMission</a></p></html>"));
end Pulse;
