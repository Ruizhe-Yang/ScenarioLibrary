within ScenarioLibrary.Timing;
block EventSequence "Count distinct planned event times and expose the last event id"
parameter Integer n(min=1)=3;
  parameter Modelica.Units.SI.Time times[n]={i for i in 1:n};
  parameter Integer eventIds[n]={i for i in 1:n};
    Modelica.Blocks.Interfaces.IntegerOutput eventCount annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.IntegerOutput eventId annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
initial equation
  assert(n>=1,"Empty time table.");
  for i in 2:n loop assert(times[i]>times[i-1],"Times must be strictly increasing."); end for;
equation
  eventCount=ScenarioLibrary.Utilities.Functions.TableIndex(time,times);
  eventId=if eventCount>0 then eventIds[eventCount] else 0;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-63,-36},{63,-36}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Line(points={{-40,-36},{-40,34}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{0,-36},{0,34}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{40,-36},{40,34}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-51,67},{-29,42}}, textString="1", textColor={0,0,127}, fontSize=0),
        Text(extent={{-11,67},{11,42}}, textString="2", textColor={0,0,127}, fontSize=0),
        Text(extent={{29,67},{51,42}}, textString="3", textColor={0,0,127}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Count distinct planned event times and expose the last event id.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.IntegerOutput eventCount; Modelica.Blocks.Interfaces.IntegerOutput eventId</p><p><b>Parameters</b> parameter Integer n(min=1)=3; parameter Modelica.Units.SI.Time times[n]={i for i in 1:n}; parameter Integer eventIds[n]={i for i in 1:n}</p><p><b>Behavior</b> Count distinct planned event times and expose the last event id</p><p><b>Initialization</b> The declared start values and initialization equations apply.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> eventCount, eventId</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.PhaseQualifiedWindows\">ScenarioLibrary.Examples.PhaseQualifiedWindows</a></p></html>"));
end EventSequence;
