within ScenarioLibrary.Operating;
block LoadDemand "Range-checked load table with selectable interpolation"
parameter Integer n(min=1)=2 "Number of table nodes";
  parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n) "Strictly increasing table times";
  parameter Real values[n]=linspace(0,1,n) "Values at the table nodes";
  parameter String unitText="1" "Descriptive signal unit; no unit conversion is performed";
  parameter Real lower=0 "Lower accepted table value";
  parameter Real upper=1 "Upper accepted table value";
  parameter ScenarioLibrary.Utilities.Types.ProfileInterpolation method=ScenarioLibrary.Utilities.Types.ProfileInterpolation.Linear "Interpolation rule for the planned load";
  Modelica.Blocks.Interfaces.RealOutput y  "Planned load in the intended signal unit" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
protected
  ScenarioLibrary.Profiles.PiecewiseLinear lin(n=n,times=times,values=values) "Linearly interpolated load path";
  ScenarioLibrary.Profiles.PiecewiseConstant hold(n=n,times=times,values=values,baseline=values[1]) "Right-continuous held load path";
initial equation
  assert(lower<=upper and min(values)>=lower and max(values)<=upper,"Load outside declared range.");
equation
  y=if method==ScenarioLibrary.Utilities.Types.ProfileInterpolation.Linear then lin.y else hold.y;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-61,47},{65,47}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Line(points={{-61,-32},{65,-32}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Line(points={{-57,-17},{-29,17},{5,17},{26,-9},{59,31}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Select linear interpolation or right-continuous holding of <code>values</code> at the given <code>times</code>. Both choices hold the first value before the table and the last value afterwards. Timing is absolute.</p><p>Initial assertions check that every table value lies between <code>lower</code> and <code>upper</code>. These parameters validate the table rather than clip the output. <code>unitText</code> is descriptive metadata and does not assign or convert a connector unit.</p></html>"));
end LoadDemand;
