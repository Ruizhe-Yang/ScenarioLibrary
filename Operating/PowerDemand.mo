within ScenarioLibrary.Operating;
block PowerDemand "Base power plus independently weighted task demands"
  parameter Integer n(min=1) = 2 "Number of independent task channels";
  parameter Modelica.Units.SI.Power basePower(min=0) = 10 "Nonnegative base demand";
  parameter Modelica.Units.SI.Power ratings[n](each min=0) = fill(20,n) "Nonnegative rated power of each task";
  Modelica.Blocks.Interfaces.RealInput fraction[n](each min=0,each max=1) "Requested fraction of each task rating" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Interfaces.RealOutput power(unit="W") "Total planned power demand" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
initial equation
  assert(n >= 1 and basePower >= 0 and min(ratings) >= 0, "Power ratings must be nonnegative.");
equation
  for i in 1:n loop
    assert(noEvent(fraction[i] >= -1e-9 and fraction[i] <= 1+1e-9), "Power demand fraction outside [0,1].");
  end for;
  power = basePower+sum({ratings[i]*min(1,max(0,fraction[i])) for i in 1:n});
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-24,-24},{24,24}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-20,-20},{20,20}}, textString="+", textColor={0,0,127}, fontSize=0),
        Line(points={{24,0},{66,0}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{-66,-45},{-42,-45},{-24,0}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-66,0},{-42,0},{-24,0}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-66,45},{-42,45},{-24,0}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{25,53},{66,18}}, textString="P", textColor={0,0,127}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="PowerDemand")}),
    Documentation(info="<html><p>Compute <code>power=basePower+sum(ratings[i]*fraction[i])</code> from nonnegative base power and ratings. Each fraction is clamped to [0,1] in this calculation.</p><p>Runtime assertions allow only a small numerical tolerance of 1e-9 outside the fraction interval. The result is a prescribed power demand in watts; no physical power port is included.</p></html>"));
end PowerDemand;
