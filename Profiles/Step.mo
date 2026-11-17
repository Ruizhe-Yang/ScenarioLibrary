within ScenarioLibrary.Profiles;
block Step "Scheduled step with an optional local time origin"
parameter Boolean useEnableInput=false "Expose enable and restart local time on each rising edge";
  parameter Real baseline=0 "Output before the step or while disabled";

  parameter Real height=1 "Signed change from the baseline";
  parameter Modelica.Units.SI.Time startTime=1 "Start time on the selected time base";
  Modelica.Blocks.Interfaces.BooleanInput enable if useEnableInput  "Enable the profile and restart its local clock on a rising edge" annotation(Placement(transformation(origin={0,100},extent={{-10,-10},{10,10}}),iconTransformation(origin={0,100},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput y  "Prescribed output signal" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
protected
  Modelica.Blocks.Interfaces.BooleanInput enabled  "Internal profile-enable signal" annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  discrete Modelica.Units.SI.Time origin(start=0,fixed=true) "Time of the most recent enable edge or initialisation";
  Modelica.Units.SI.Time tLocal "Time on the selected absolute or local time base";
equation
  connect(enable,enabled);
  if not useEnableInput then enabled=true; end if;
  when {initial(),enabled} then origin=time; end when;
  tLocal=if useEnableInput then time-origin else time;
  y=if enabled then baseline+(if tLocal>=startTime then height else 0) else baseline;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-30},{-18,-30},{-18,36},{64,36}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Output <code>baseline</code> before <code>startTime</code> and <code>baseline+height</code> from that instant onwards while enabled. The value at the step boundary is the new value.</p><p>With <code>useEnableInput=false</code>, the time base is absolute simulation time. Otherwise, each rising <code>enable</code> edge sets a new local origin; disabling returns <code>baseline</code> immediately. Re-enabling restarts the profile.</p></html>"));
end Step;
