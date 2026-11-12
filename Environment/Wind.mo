within ScenarioLibrary.Environment;
block Wind "Three planned wind velocity profiles"
parameter Integer n(min=1)=2;
  parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n);
  parameter Modelica.Units.SI.Velocity values[n,3]=fill(0,n,3);
    Modelica.Blocks.Interfaces.RealOutput vx(unit="m/s") annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput vy(unit="m/s") annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput vz(unit="m/s") annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
protected
  ScenarioLibrary.Profiles.PiecewiseLinear x(n=n,times=times,values=values[:,1]);
  ScenarioLibrary.Profiles.PiecewiseLinear y(n=n,times=times,values=values[:,2]);
  ScenarioLibrary.Profiles.PiecewiseLinear z(n=n,times=times,values=values[:,3]);
equation
  connect(x.y,vx);
  connect(y.y,vy);
  connect(z.y,vz);
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-60,34},{-20,34},{-5,47},{54,47}}, color={0,0,127}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-60,0},{-30,15},{15,-3},{54,17}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-60,-34},{-20,-16},{20,-38},{54,-38}}, color={64,64,64}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-66,78},{67,58}}, textString="vx, vy, vz", textColor={0,0,127}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Three planned wind velocity profiles.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput vx(unit=\"m/s\"); Modelica.Blocks.Interfaces.RealOutput vy(unit=\"m/s\"); Modelica.Blocks.Interfaces.RealOutput vz(unit=\"m/s\")</p><p><b>Parameters</b> parameter Integer n(min=1)=2; parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n); parameter Modelica.Units.SI.Velocity values[n,3]=fill(0,n,3)</p><p><b>Behavior</b> Three planned wind velocity profiles</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> vx, vy, vz</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.EnvironmentalConditions\">ScenarioLibrary.Examples.EnvironmentalConditions</a></p></html>"));
end Wind;
