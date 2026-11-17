within ScenarioLibrary.Operating;
block ValveOpeningProfile "Cubic opening and closing commands between two settings"
  parameter Modelica.Units.SI.Time openAt = 1 "Absolute start of the opening transition";
  parameter Modelica.Units.SI.Time closeAt = 6 "Absolute start of the closing transition";
  parameter Modelica.Units.SI.Time openingTime(min=Modelica.Constants.small) = 1 "Positive duration of the opening transition";
  parameter Modelica.Units.SI.Time closingTime(min=Modelica.Constants.small) = 1.5 "Positive duration of the closing transition";
  parameter Real standbyOpening(min=0,max=1) = 0.05 "Opening before the sequence and after closing";
  parameter Real operatingOpening(min=0,max=1) = 0.85 "Opening between the transitions";
  Modelica.Blocks.Interfaces.RealOutput opening(min=0,max=1) "Prescribed valve-opening fraction" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
protected
  Real up "Normalised progress of the opening transition";
  Real down "Normalised progress of the closing transition";
initial equation
  assert(openingTime > 0 and closingTime > 0 and closeAt >= openAt+openingTime and
    standbyOpening >= 0 and standbyOpening <= 1 and operatingOpening >= 0 and operatingOpening <= 1, "Invalid opening schedule.");
equation
  up = min(1,max(0,(time-openAt)/openingTime));
  down = min(1,max(0,(time-closeAt)/closingTime));
  opening = standbyOpening+(operatingOpening-standbyOpening)*(up^2*(3-2*up)-down^2*(3-2*down));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Polygon(points={{-24.48,32},{-24.48,56},{0,44},{-24.48,32}}, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Polygon(points={{24.48,32},{24.48,56},{0,44},{24.48,32}}, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{0,44},{0,64.16}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-8.16,64.16},{8.16,64.16}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-58,-39},{-55.273,-39},{-52.545,-39},{-49.818,-39},{-47.091,-39},{-44.364,-38.639},{-41.636,-36.593},{-38.909,-33.07},{-36.182,-28.449},{-33.455,-23.109},{-30.727,-17.427},{-28,-11.784},{-25.273,-6.557},{-22.545,-2.126},{-19.818,1.132},{-17.091,2.837},{-14.364,3},{-11.636,3},{-8.909,3},{-6.182,3},{-3.455,3},{-0.727,3},{2,3},{4.727,3},{7.455,3},{10.182,3},{12.909,3},{15.636,3},{18.364,3},{21.091,2.837},{23.818,1.132},{26.545,-2.126},{29.273,-6.557},{32,-11.784},{34.727,-17.427},{37.455,-23.109},{40.182,-28.449},{42.909,-33.07},{45.636,-36.593},{48.364,-38.639},{51.091,-39},{53.818,-39},{56.545,-39},{59.273,-39},{62,-39}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="ValveOpeningProfile")}),
    Documentation(info="<html><p>Move from <code>standbyOpening</code> to <code>operatingOpening</code> using a cubic transition from <code>openAt</code>. Return using a second cubic transition from <code>closeAt</code>. Each transition has zero slope at its endpoints.</p><p>Both openings must lie in [0,1], both transition durations must be positive, and closing may not begin before the opening transition ends. The output remains within the two configured values.</p></html>"));
end ValveOpeningProfile;
