within ScenarioLibrary.Operating;
block CommandSchedule "Right-continuous planned boolean schedule"
parameter Integer n(min=1)=2;
  parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n);
  parameter Boolean values[n]=fill(false,n);
  parameter Boolean baseline=false;
  Modelica.Blocks.Interfaces.BooleanOutput y annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
protected
  Integer i;
initial equation
  assert(n>=1,"Empty time table.");
  for i in 2:n loop assert(times[i]>times[i-1],"Times must be strictly increasing."); end for;
equation
  i=ScenarioLibrary.Utilities.Functions.TableIndex(time,times);
  y=if i>0 then values[i] else baseline;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-59,-30},{-38,-30},{-38,31},{-5,31},{-5,-30},{22,-30},{22,31},{63,31}}, color={128,0,128}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-42,76},{58,51}}, textString="B(t)", textColor={128,0,128}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Right-continuous planned boolean schedule.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.BooleanOutput y</p><p><b>Parameters</b> parameter Integer n(min=1)=2; parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n); parameter Boolean values[n]=fill(false,n); parameter Boolean baseline=false</p><p><b>Behavior</b> Right-continuous planned boolean schedule</p><p><b>Initialization</b> The declared start values and initialization equations apply.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> y</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.LoadAndCommandSchedules\">ScenarioLibrary.Examples.LoadAndCommandSchedules</a></p></html>"));
end CommandSchedule;
