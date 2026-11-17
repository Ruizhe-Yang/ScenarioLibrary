within ScenarioLibrary.Profiles;
block PiecewiseConstant "Right-continuous table with a configurable initial value"
parameter Boolean useEnableInput=false "Expose enable and restart local time on each rising edge";
  parameter Real baseline=0 "Output before the first table node or while disabled";
  parameter Integer n(min=1)=2 "Number of table nodes";
  parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n) "Strictly increasing table times";
  parameter Real values[n]=linspace(0,1,n) "Values at the table nodes";
  Modelica.Blocks.Interfaces.BooleanInput enable if useEnableInput  "Enable the profile and restart its local clock on a rising edge" annotation(Placement(transformation(origin={0,100},extent={{-10,-10},{10,10}}),iconTransformation(origin={0,100},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput y  "Prescribed output signal" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
protected
  Modelica.Blocks.Interfaces.BooleanInput enabled  "Internal profile-enable signal" annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  discrete Modelica.Units.SI.Time origin(start=0,fixed=true) "Time of the most recent enable edge or initialisation";
  Modelica.Units.SI.Time tLocal "Time on the selected absolute or local time base";
initial equation
  assert(n>=1,"Empty time table.");
  for i in 2:n loop assert(times[i]>times[i-1],"Times must be strictly increasing."); end for;
equation
  connect(enable,enabled);
  if not useEnableInput then enabled=true; end if;
  when {initial(),enabled} then origin=time; end when;
  tLocal=if useEnableInput then time-origin else time;
  y=if enabled then (if ScenarioLibrary.Utilities.Functions.TableIndex(tLocal,times)==0 then baseline else values[ScenarioLibrary.Utilities.Functions.TableIndex(tLocal,times)]) else baseline;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-30},{-33,-30},{-33,27},{-3,27},{-3,-3},{29,-3},{29,41},{63,41}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Use <code>baseline</code> before the first table time. At each strictly increasing <code>times[i]</code>, switch to <code>values[i]</code> and hold it until the next node. The final value is held indefinitely while enabled.</p><p>With <code>useEnableInput=false</code>, the time base is absolute simulation time. Otherwise, each rising <code>enable</code> edge sets a new local origin; disabling returns <code>baseline</code> immediately. Re-enabling restarts the profile.</p></html>"));
end PiecewiseConstant;
