within ScenarioLibrary.Operating;
block OperatingPoint "Fixed vector with per-channel metadata"
parameter Integer n(min=1)=1;
  parameter Real values[n]=fill(0,n);
  parameter String names[n]={"channel "+String(i) for i in 1:n};
  parameter String units[n]=fill("1",n);
  parameter Real lower[n]=fill(-Modelica.Constants.inf,n);
  parameter Real upper[n]=fill(Modelica.Constants.inf,n);
  Modelica.Blocks.Interfaces.RealOutput y[n] annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
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
    Documentation(info="<html><p><b>Purpose</b> Fixed vector with per-channel metadata.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput y[n]</p><p><b>Parameters</b> parameter Integer n(min=1)=1; parameter Real values[n]=fill(0,n); parameter String names[n]={\"channel \"+String(i) for i in 1:n}; parameter String units[n]=fill(\"1\",n); parameter Real lower[n]=fill(-Modelica.Constants.inf,n); parameter Real upper[n]=fill(Modelica.Constants.inf,n)</p><p><b>Behavior</b> Fixed vector with per-channel metadata</p><p><b>Initialization</b> The declared start values and initialization equations apply.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> y</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.LoadAndCommandSchedules\">ScenarioLibrary.Examples.LoadAndCommandSchedules</a></p></html>"));
end OperatingPoint;
