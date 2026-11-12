within ScenarioLibrary.Operating;
block ModeSchedule "Right-continuous planned integer schedule"
parameter Integer n(min=1)=2;
  parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n);
  parameter Integer values[n]=fill(0,n);
  parameter Integer baseline=0;
  Modelica.Blocks.Interfaces.IntegerOutput y annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
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
        Line(points={{-59,-30},{-35,-30},{-35,4},{3,4},{3,34},{34,34},{34,4},{63,4}}, color={180,100,0}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-58,-22},{-36,2}}, textString="1", textColor={64,64,64}, fontSize=0),
        Text(extent={{-24,9},{0,33}}, textString="2", textColor={64,64,64}, fontSize=0),
        Text(extent={{6,39},{30,63}}, textString="3", textColor={64,64,64}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Right-continuous planned integer schedule.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.IntegerOutput y</p><p><b>Parameters</b> parameter Integer n(min=1)=2; parameter Modelica.Units.SI.Time times[n]=linspace(0,1,n); parameter Integer values[n]=fill(0,n); parameter Integer baseline=0</p><p><b>Behavior</b> Right-continuous planned integer schedule</p><p><b>Initialization</b> The declared start values and initialization equations apply.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> y</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.LoadAndCommandSchedules\">ScenarioLibrary.Examples.LoadAndCommandSchedules</a></p></html>"));
end ModeSchedule;
