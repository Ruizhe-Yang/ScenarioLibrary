within ScenarioLibrary.Operating;
block OperatingPoint "Constant operating vector with channel metadata"
parameter Integer n(min=1)=1 "Number of operating-point channels";
  parameter Real values[n]=fill(0,n) "Constant operating-point values";
  parameter String names[n]={"channel "+String(i) for i in 1:n} "Descriptive channel names";
  parameter String units[n]=fill("1",n) "Descriptive channel units; no unit conversion is performed";
  parameter Real lower[n]=fill(-Modelica.Constants.inf,n) "Lower accepted value for each channel";
  parameter Real upper[n]=fill(Modelica.Constants.inf,n) "Upper accepted value for each channel";
  Modelica.Blocks.Interfaces.RealOutput y[n]  "Constant operating-point vector" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
initial equation
  for i in 1:n loop assert(lower[i]<=values[i] and values[i]<=upper[i],"Operating point outside declared range."); end for;
equation
  y=values;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-51,-51},{51,51}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-51,17},{51,17}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-51,-17},{51,-17}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{-39,47},{39,21}}, textString="x1", textColor={0,0,127}, fontSize=0),
        Text(extent={{-39,13},{39,-13}}, textString="x2", textColor={0,0,127}, fontSize=0),
        Text(extent={{-39,-21},{39,-47}}, textString="x3", textColor={0,0,127}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Output the configured <code>values[n]</code> without time variation. Initial assertions check each value against its own lower and upper bounds.</p><p><code>names</code> and <code>units</code> describe channels; they do not alter the output equations or perform unit conversion. Match these conventions to the receiving signals.</p></html>"));
end OperatingPoint;
