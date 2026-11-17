within ScenarioLibrary.Operating;
block TorqueSpeedMap "Signed opposing torque from an absolute-speed table"
  parameter Integer n(min=2) = 3 "Number of speed-torque table nodes";
  parameter Real points[n,2] = [0,0;10,1;30,3] "Absolute angular speed and opposing torque magnitude pairs";
  Modelica.Blocks.Interfaces.RealInput speed(unit="rad/s")  "Signed angular speed" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Interfaces.RealOutput torque(unit="N.m") "Signed torque command opposing rotation" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
protected
  Modelica.Blocks.Tables.CombiTable1Ds profile(table=points,columns={2},
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) "Linear table of torque magnitude against absolute speed";
initial equation
  assert(n>=2 and abs(points[1,1])<=1e-12 and abs(points[1,2])<=1e-12 and
    min(points[:,2])>=0 and min(points[2:n,1]-points[1:n-1,1])>0,"Invalid torque map.");
equation
  profile.u = abs(speed);
  torque = -sign(speed)*profile.y[1];
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-65,0},{65,0}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{0,-52},{0,52}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-62,39},{-37,39},{-10,9},{0,0},{10,-9},{37,-39},{62,-39}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-70,76},{70,53}}, textString="tau(w)", textColor={0,0,127}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Interpolate a nonnegative torque magnitude against <code>abs(speed)</code>, then apply <code>-sign(speed)</code> so the command opposes rotation. At zero speed the torque is zero; beyond the table range the final magnitude is held.</p><p>The table must contain at least two nodes, begin at zero speed and zero torque, and use strictly increasing speed coordinates. This block provides a torque signal rather than a mechanical connection.</p></html>"));
end TorqueSpeedMap;
