within ScenarioLibrary.Profiles;
block Sine "Sinusoidal profile within a half-open time window"
parameter Boolean useEnableInput=false "Expose enable and restart local time on each rising edge";
  parameter Real baseline=0 "Output outside the enabled sinusoidal window";

  parameter Real amplitude=1 "Sinusoidal or pulse amplitude";
  parameter Modelica.Units.SI.Frequency frequency(min=0)=1 "Sinusoidal frequency";
  parameter Modelica.Units.SI.Angle phase=0 "Phase angle at the start of the sinusoid";
  parameter Modelica.Units.SI.Time startTime=0 "Start time on the selected time base";
  parameter Modelica.Units.SI.Time endTime=Modelica.Constants.inf "Exclusive end of the sinusoidal window";
  Modelica.Blocks.Interfaces.BooleanInput enable if useEnableInput  "Enable the profile and restart its local clock on a rising edge" annotation(Placement(transformation(origin={0,100},extent={{-10,-10},{10,10}}),iconTransformation(origin={0,100},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput y  "Prescribed output signal" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
protected
  Modelica.Blocks.Interfaces.BooleanInput enabled  "Internal profile-enable signal" annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  discrete Modelica.Units.SI.Time origin(start=0,fixed=true) "Time of the most recent enable edge or initialisation";
  Modelica.Units.SI.Time tLocal "Time on the selected absolute or local time base";
initial equation
  assert(frequency>=0 and endTime>=startTime,"Invalid sine window.");
equation
  connect(enable,enabled);
  if not useEnableInput then enabled=true; end if;
  when {initial(),enabled} then origin=time; end when;
  tLocal=if useEnableInput then time-origin else time;
  y=if enabled then baseline+(if tLocal>=startTime and tLocal<endTime then amplitude*sin(2*Modelica.Constants.pi*frequency*(tLocal-startTime)+phase) else 0) else baseline;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-61,-8},{-50,-8}}, color={0,0,127}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{-50,-8},{-48.317,-0.515},{-46.633,6.643},{-44.95,13.16},{-43.267,18.753},{-41.583,23.177},{-39.9,26.238},{-38.217,27.803},{-36.533,27.803},{-34.85,26.238},{-33.167,23.177},{-31.483,18.753},{-29.8,13.16},{-28.117,6.643},{-26.433,-0.515},{-24.75,-8},{-23.067,-15.485},{-21.383,-22.643},{-19.7,-29.16},{-18.017,-34.753},{-16.333,-39.177},{-14.65,-42.238},{-12.967,-43.803},{-11.283,-43.803},{-9.6,-42.238},{-7.917,-39.177},{-6.233,-34.753},{-4.55,-29.16},{-2.867,-22.643},{-1.183,-15.485},{0.5,-8},{2.183,-0.515},{3.867,6.643},{5.55,13.16},{7.233,18.753},{8.917,23.177},{10.6,26.238},{12.283,27.803},{13.967,27.803},{15.65,26.238},{17.333,23.177},{19.017,18.753},{20.7,13.16},{22.383,6.643},{24.067,-0.515},{25.75,-8},{27.433,-15.485},{29.117,-22.643},{30.8,-29.16},{32.483,-34.753},{34.167,-39.177},{35.85,-42.238},{37.533,-43.803},{39.217,-43.803},{40.9,-42.238},{42.583,-39.177},{44.267,-34.753},{45.95,-29.16},{47.633,-22.643},{49.317,-15.485},{51,-8}}, color={0,0,127}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{51,-8},{64,-8}}, color={0,0,127}, thickness=1.1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Add <code>amplitude*sin(2*pi*frequency*(tLocal-startTime)+phase)</code> to <code>baseline</code> during <code>[startTime,endTime)</code>. Outside that interval the output is <code>baseline</code>. Frequency is nonnegative and the end must not precede the start.</p><p>With <code>useEnableInput=false</code>, the time base is absolute simulation time. Otherwise, each rising <code>enable</code> edge sets a new local origin; disabling returns <code>baseline</code> immediately. Re-enabling restarts the profile.</p></html>"));
end Sine;
