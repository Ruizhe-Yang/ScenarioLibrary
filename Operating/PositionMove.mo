within ScenarioLibrary.Operating;
block PositionMove "Quintic position command with zero endpoint velocity and acceleration"
  parameter Modelica.Units.SI.Position initialPosition = 0 "Position before the scheduled move";
  parameter Modelica.Units.SI.Position targetPosition = 1 "Position after the scheduled move";
  parameter Modelica.Units.SI.Time startTime = 1 "Absolute start of the position move";
  parameter Modelica.Units.SI.Time duration(min=Modelica.Constants.small) = 2 "Positive duration of the quintic move";
  Modelica.Blocks.Interfaces.RealOutput position(unit="m") "Prescribed position trajectory" annotation(Placement(transformation(extent={{94,42},{106,54}}), iconTransformation(extent={{94,42},{106,54}})));
  Modelica.Blocks.Interfaces.RealOutput velocity(unit="m/s") "Analytical velocity of the position trajectory" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
  Modelica.Blocks.Interfaces.BooleanOutput arrived "The scheduled move has reached its final time" annotation(Placement(transformation(extent={{94,-54},{106,-42}}), iconTransformation(extent={{94,-54},{106,-42}})));
protected
  Real x(min=0,max=1) "Normalised progress clamped to the move interval";
  Modelica.Units.SI.Length travel "Signed displacement between the endpoint positions";
initial equation
  assert(duration > 0, "Move duration must be positive.");
equation
  x = min(1,max(0,(time-startTime)/duration));
  travel = targetPosition-initialPosition;
  position = initialPosition+travel*x^3*(10+x*(-15+6*x));
  velocity = travel*30*x^2*(1-x)^2/duration;
  arrived = time >= startTime+duration;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-30},{-55.273,-29.992},{-52.545,-29.937},{-49.818,-29.794},{-47.091,-29.53},{-44.364,-29.115},{-41.636,-28.527},{-38.909,-27.749},{-36.182,-26.767},{-33.455,-25.574},{-30.727,-24.167},{-28,-22.547},{-25.273,-20.718},{-22.545,-18.687},{-19.818,-16.468},{-17.091,-14.072},{-14.364,-11.517},{-11.636,-8.821},{-8.909,-6.005},{-6.182,-3.091},{-3.455,-0.103},{-0.727,2.936},{2,6},{4.727,9.064},{7.455,12.103},{10.182,15.091},{12.909,18.005},{15.636,20.821},{18.364,23.517},{21.091,26.072},{23.818,28.468},{26.545,30.687},{29.273,32.718},{32,34.547},{34.727,36.167},{37.455,37.574},{40.182,38.767},{42.909,39.749},{45.636,40.527},{48.364,41.115},{51.091,41.53},{53.818,41.794},{56.545,41.937},{59.273,41.992},{62,42}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,73},{66,48}}, textString="s(t)", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="PositionMove")}),
    Documentation(info="<html><p>Interpolate from <code>initialPosition</code> to <code>targetPosition</code> using a quintic polynomial over the positive <code>duration</code>. The position is held outside the move; the analytical <code>velocity</code> and acceleration vanish at both endpoints.</p><p><code>arrived</code> becomes true when the scheduled move ends. It reports the planned trajectory boundary and does not measure the position of a connected plant.</p></html>"));
end PositionMove;
