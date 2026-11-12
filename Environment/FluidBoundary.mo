within ScenarioLibrary.Environment;
block FluidBoundary "Planned pressure, temperature and composition signals"
parameter Modelica.Units.SI.AbsolutePressure pressure(min=0)=101325;
  parameter Modelica.Units.SI.Temperature temperature(min=0)=293.15;
  parameter Integer nX(min=1)=1;
  parameter Real fractions[nX]=fill(1.0/nX,nX);
    Modelica.Blocks.Interfaces.RealOutput p(unit="Pa") annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput T(unit="K") annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput X[nX] annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
initial equation
  assert(pressure>0 and temperature>0 and min(fractions)>=0 and abs(sum(fractions)-1)<1e-8,"Invalid boundary state.");
equation
  p=pressure;
  T=temperature;
  X=fractions;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-61,-49},{61,49}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-61,17},{61,17}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Line(points={{-16,-49},{-16,49}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Text(extent={{-53,10},{-23,-37}}, textString="p", textColor={0,0,127}, fontSize=0),
        Line(points={{-5,-3},{45,-3}}, color={128,128,128}, thickness=0.7, pattern=LinePattern.Solid),
        Line(points={{-5,-27},{31,-27}}, color={128,128,128}, thickness=0.7, pattern=LinePattern.Solid),
        Text(extent={{1,12},{24,-8}}, textString="T", textColor={191,0,0}, fontSize=0),
        Text(extent={{28,-11},{49,-35}}, textString="X", textColor={0,0,127}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Planned pressure, temperature and composition signals.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput p(unit=\"Pa\"); Modelica.Blocks.Interfaces.RealOutput T(unit=\"K\"); Modelica.Blocks.Interfaces.RealOutput X[nX]</p><p><b>Parameters</b> parameter Modelica.Units.SI.AbsolutePressure pressure(min=0)=101325; parameter Modelica.Units.SI.Temperature temperature(min=0)=293.15; parameter Integer nX(min=1)=1; parameter Real fractions[nX]=fill(1.0/nX,nX)</p><p><b>Behavior</b> Planned pressure, temperature and composition signals</p><p><b>Initialization</b> The declared start values and initialization equations apply.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Composition size and medium selection must match the receiving boundary.</p><p><b>Observables</b> p, T, X</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.EnvironmentalConditions\">ScenarioLibrary.Examples.EnvironmentalConditions</a></p></html>"));
end FluidBoundary;
