within ScenarioLibrary.Operating;
block SpeedSweep "Logarithmic angular-speed sweep with held endpoints"
  parameter Modelica.Units.SI.AngularVelocity startSpeed(min=Modelica.Constants.small) = 2 "Positive angular speed before the sweep";
  parameter Modelica.Units.SI.AngularVelocity endSpeed(min=Modelica.Constants.small) = 12 "Positive angular speed after the sweep";
  parameter Modelica.Units.SI.Time startTime = 1 "Absolute start of the angular-speed sweep";
  parameter Modelica.Units.SI.Time duration(min=Modelica.Constants.small) = 6 "Positive duration of the logarithmic sweep";
  Modelica.Blocks.Interfaces.RealOutput speed(unit="rad/s") "Prescribed angular-speed trajectory" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.RealOutput acceleration(unit="rad/s2") "Analytical angular acceleration within the sweep, zero outside" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
protected
  final parameter Real span = log(endSpeed/startSpeed) "Logarithm of the end-to-start speed ratio";
  Real progress "Normalised progress clamped to the sweep interval";
initial equation
  assert(startSpeed > 0 and endSpeed > 0 and duration > 0, "Positive speeds and duration required.");
equation
  progress = min(1,max(0,(time-startTime)/duration));
  speed = startSpeed*exp(progress*span);
  acceleration = if time >= startTime and time < startTime+duration then speed*span/duration else 0;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-32},{-55.273,-31.581},{-52.545,-31.138},{-49.818,-30.67},{-47.091,-30.176},{-44.364,-29.654},{-41.636,-29.103},{-38.909,-28.521},{-36.182,-27.906},{-33.455,-27.257},{-30.727,-26.572},{-28,-25.848},{-25.273,-25.084},{-22.545,-24.277},{-19.818,-23.424},{-17.091,-22.524},{-14.364,-21.573},{-11.636,-20.569},{-8.909,-19.509},{-6.182,-18.389},{-3.455,-17.207},{-0.727,-15.958},{2,-14.639},{4.727,-13.247},{7.455,-11.776},{10.182,-10.223},{12.909,-8.582},{15.636,-6.85},{18.364,-5.021},{21.091,-3.089},{23.818,-1.048},{26.545,1.106},{29.273,3.382},{32,5.785},{34.727,8.322},{37.455,11.002},{40.182,13.833},{42.909,16.822},{45.636,19.978},{48.364,23.311},{51.091,26.832},{53.818,30.549},{56.545,34.475},{59.273,38.621},{62,43}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,73},{66,48}}, textString="w(t)", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="SpeedSweep")}),
    Documentation(info="<html><p>Vary positive angular speed exponentially between <code>startSpeed</code> and <code>endSpeed</code> over the positive <code>duration</code>. Hold the start and end values before and after the absolute sweep interval. An end speed below the start speed gives a decreasing sweep.</p><p><code>acceleration</code> is the analytical derivative during the half-open sweep interval and zero outside it. Speed is continuous; acceleration can jump at the endpoints.</p></html>"));
end SpeedSweep;
