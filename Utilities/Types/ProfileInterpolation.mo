within ScenarioLibrary.Utilities.Types;
type ProfileInterpolation = enumeration(Constant "Piecewise-constant values", Linear "Linear interpolation between coordinates") "Profile interpolation policy" annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-85,-85},{85,85}}, lineColor={128,128,128}, fillColor={160,160,164}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=18),
        Text(extent={{-68,68},{-14,20}}, textString="E", textColor={255,255,255}, fontSize=0),
        Line(points={{-56,-46},{-9,-5},{55,-5}}, color={255,255,255}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-56,-61},{3,-61},{3,-29},{55,-29}}, color={255,255,255}, thickness=1, pattern=LinePattern.Solid)
      }), Documentation(info="<html><p>Select Constant or Linear interpolation for a planned scalar profile. The receiving component defines endpoint and repetition behaviour.</p></html>"));
