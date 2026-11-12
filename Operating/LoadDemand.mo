within ScenarioLibrary.Operating;
block LoadDemand "Bounded planned load demand"
parameter Integer n(min=1)=2;
  parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n);
  parameter Real values[n]=linspace(0,1,n);
  parameter String unitText="1";
  parameter Real lower=0;
  parameter Real upper=1;
  parameter ScenarioLibrary.Utilities.Types.ProfileInterpolation method=ScenarioLibrary.Utilities.Types.ProfileInterpolation.Linear;
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
protected
  ScenarioLibrary.Profiles.PiecewiseLinear lin(n=n,times=times,values=values);
  ScenarioLibrary.Profiles.PiecewiseConstant hold(n=n,times=times,values=values,baseline=values[1]);
initial equation
  assert(lower<=upper and min(values)>=lower and max(values)<=upper,"Load outside declared range.");
equation
  y=if method==ScenarioLibrary.Utilities.Types.ProfileInterpolation.Linear then lin.y else hold.y;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-61,47},{65,47}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Line(points={{-61,-32},{65,-32}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Line(points={{-57,-17},{-29,17},{5,17},{26,-9},{59,31}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Bounded planned load demand.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput y</p><p><b>Parameters</b> parameter Integer n(min=1)=2; parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n); parameter Real values[n]=linspace(0,1,n); parameter String unitText=\"1\"; parameter Real lower=0; parameter Real upper=1; parameter ScenarioLibrary.Utilities.Types.ProfileInterpolation method=ScenarioLibrary.Utilities.Types.ProfileInterpolation.Linear</p><p><b>Behavior</b> Bounded planned load demand</p><p><b>Initialization</b> The declared start values and initialization equations apply.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> y</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.LoadAndCommandSchedules\">ScenarioLibrary.Examples.LoadAndCommandSchedules</a></p></html>"));
end LoadDemand;
