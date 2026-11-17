within ScenarioLibrary.Environment;
block Inclination "Gravity components for an upward-positive slope"
parameter Modelica.Units.SI.Angle alpha=0 "Slope angle for the upward-positive tangent";
  parameter Modelica.Units.SI.Acceleration g(min=0)=Modelica.Constants.g_n "Nonnegative gravity magnitude";
    Modelica.Blocks.Interfaces.RealOutput sinAlpha  "Sine of the prescribed slope angle" annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput cosAlpha  "Cosine of the prescribed slope angle" annotation(Placement(transformation(origin={100,23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput alongSlope(unit="m/s2")  "Gravity acceleration along the upward-positive tangent" annotation(Placement(transformation(origin={100,-23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput normal(unit="m/s2")  "Gravity acceleration along the outward-positive normal" annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
equation
  sinAlpha=sin(alpha);
  cosAlpha=cos(alpha);
  alongSlope=-g*sinAlpha;
  normal=-g*cosAlpha;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-64,-38},{62,29}}, color={64,64,64}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-7,-7},{-7,-60}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{-7,-7},{-49,-29}}, color={0,0,127}, thickness=1, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{-7,-7},{16,-49}}, color={0,0,127}, thickness=1, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{26,65},{57,37}}, textString="g", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Resolve gravity for the prescribed angle <code>alpha</code>. Outputs are <code>sin(alpha)</code>, <code>cos(alpha)</code>, <code>alongSlope=-g*sin(alpha)</code> and <code>normal=-g*cos(alpha)</code>.</p><p>The positive tangent points uphill and the positive normal points away from the supporting surface. These are acceleration signals; connect them consistently with the receiving coordinate convention.</p></html>"));
end Inclination;
