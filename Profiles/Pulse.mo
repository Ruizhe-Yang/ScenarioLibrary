within ScenarioLibrary.Profiles;
block Pulse "Finite sequence of half-open rectangular pulses"
parameter Boolean useEnableInput=false "Expose enable and restart local time on each rising edge";
  parameter Real baseline=0 "Output between pulses and while disabled";

  parameter Real amplitude=1 "Sinusoidal or pulse amplitude";
  parameter Modelica.Units.SI.Time startTime=0 "Start time on the selected time base";
  parameter Modelica.Units.SI.Time width(min=Modelica.Constants.small)=0.2 "Positive pulse duration in each period";
  parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small)=1 "Positive repetition period";
  parameter Integer nCycles(min=1)=1 "Number of scheduled periods";
  Modelica.Blocks.Interfaces.BooleanInput enable if useEnableInput  "Enable the profile and restart its local clock on a rising edge" annotation(Placement(transformation(origin={0,100},extent={{-10,-10},{10,10}}),iconTransformation(origin={0,100},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput y  "Prescribed output signal" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
protected
  Modelica.Blocks.Interfaces.BooleanInput enabled  "Internal profile-enable signal" annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  discrete Modelica.Units.SI.Time origin(start=0,fixed=true) "Time of the most recent enable edge or initialisation";
  Modelica.Units.SI.Time tLocal "Time on the selected absolute or local time base";
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
    Documentation(info="<html><p>Add <code>amplitude</code> to <code>baseline</code> for <code>width</code> seconds at the start of each of <code>nCycles</code> periods. The first period begins at <code>startTime</code>; pulse ends and the final sequence end are excluded. Require <code>0&lt;width&lt;=period</code>.</p><p>With <code>useEnableInput=false</code>, the time base is absolute simulation time. Otherwise, each rising <code>enable</code> edge sets a new local origin; disabling returns <code>baseline</code> immediately. Re-enabling restarts the profile.</p></html>"));
end Pulse;
