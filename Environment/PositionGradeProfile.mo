within ScenarioLibrary.Environment;
block PositionGradeProfile "Position-based linear interpolation of path grade"
  parameter Integer n(min=2) = 3 "Number of strictly ordered path stations";
  parameter Real stations[n,2] = [0,0;0.5,0.08;1,0.08] "Columns: along-path position in metres and grade in radians";
  Modelica.Blocks.Interfaces.RealInput position(unit="m") "Along-path position used for interpolation" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Interfaces.RealOutput grade(unit="rad")  "Interpolated path grade" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
protected
  Modelica.Blocks.Tables.CombiTable1Ds profile(table=stations,columns={2},
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint);
initial equation
  assert(n>=2 and min(stations[2:n,1]-stations[1:n-1,1])>0 and max(abs(stations[:,2]))<=Modelica.Constants.pi/2,
    "Stations must be ordered and grade must lie within +/-pi/2.");
equation
  profile.u = position;
  connect(profile.y[1],grade);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-24},{-22,-24},{25,28},{62,28}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,73},{66,48}}, textString="grade(s)", textColor={64,64,64}, fontSize=0),
        Ellipse(extent={{-61,-27},{-55,-21}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-25,-27},{-19,-21}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{22,25},{28,31}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{59,25},{65,31}}, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Interpolate grade from <code>stations</code>, whose columns are along-path position in metres and grade in radians. Positions must be strictly increasing and all grades must lie within [-pi/2,pi/2].</p><p>Connect the current position to select the grade. Interpolation uses linear segments and holds the nearest endpoint grade outside the tabulated path. This is a position-based profile, not a time schedule.</p></html>"));
end PositionGradeProfile;
