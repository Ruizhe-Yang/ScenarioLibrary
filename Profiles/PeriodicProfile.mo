within ScenarioLibrary.Profiles;
block PeriodicProfile "Finite repetition of a linearly interpolated profile"
parameter Boolean useEnableInput=false "Expose enable and restart local time on each rising edge";
  parameter Real baseline=0 "Output before the sequence or while disabled";
  parameter Integer n(min=1)=2 "Number of table nodes";
  parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n) "Strictly increasing local table times within one period";
  parameter Real values[n]=linspace(0,1,n) "Values at the table nodes";
  parameter Modelica.Units.SI.Time startTime=0 "Start time on the selected time base";
  parameter Modelica.Units.SI.Time period(min=Modelica.Constants.small)=2 "Positive repetition period";
  parameter Integer nCycles(min=1)=2 "Number of scheduled periods";
  parameter Real endValue=0 "Held output after the final period";
  Modelica.Blocks.Interfaces.BooleanInput enable if useEnableInput  "Enable the profile and restart its local clock on a rising edge" annotation(Placement(transformation(origin={0,100},extent={{-10,-10},{10,10}}),iconTransformation(origin={0,100},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput y  "Prescribed output signal" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
protected
  Modelica.Blocks.Interfaces.BooleanInput enabled  "Internal profile-enable signal" annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  discrete Modelica.Units.SI.Time origin(start=0,fixed=true) "Time of the most recent enable edge or initialisation";
  Modelica.Units.SI.Time tLocal "Time on the selected absolute or local time base";
initial equation
  assert(n>=1,"Empty time table.");
  for i in 2:n loop assert(times[i]>times[i-1],"Times must be strictly increasing."); end for;
  assert(period>0 and nCycles>=1 and times[1]>=0 and times[n]<=period,"Invalid periodic table.");
equation
  connect(enable,enabled);
  if not useEnableInput then enabled=true; end if;
  when {initial(),enabled} then origin=time; end when;
  tLocal=if useEnableInput then time-origin else time;
  y=if enabled then (if tLocal<startTime then baseline elseif tLocal>=startTime+nCycles*period then endValue else ScenarioLibrary.Utilities.Functions.Interpolate(mod(tLocal-startTime,period),times,values)) else baseline;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-28},{-41,30},{-22,9},{-6,-28},{12,30},{31,9},{47,-28},{63,-28}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-52,58},{48,58}}, color={128,128,128}, thickness=0.7, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Repeat the local table for <code>nCycles</code> periods from <code>startTime</code>. Table times must increase strictly and lie within <code>[0,period]</code>; interpolation holds endpoint values in any unused part of the period. Use <code>baseline</code> before the sequence and <code>endValue</code> at and after its final end while enabled.</p><p>With <code>useEnableInput=false</code>, the time base is absolute simulation time. Otherwise, each rising <code>enable</code> edge sets a new local origin; disabling returns <code>baseline</code> immediately. Re-enabling restarts the profile.</p></html>"));
end PeriodicProfile;
