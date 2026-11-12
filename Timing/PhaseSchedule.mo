within ScenarioLibrary.Timing;
block PhaseSchedule "Ordered absolute phase schedule with an explicit completed state"
parameter Integer n(min=1)=2;
  parameter Modelica.Units.SI.Time boundaries[n+1]=linspace(0,n,n+1);
  parameter Integer phaseIds[n]={i for i in 1:n};
    Modelica.Blocks.Interfaces.IntegerOutput phaseIndex annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.IntegerOutput phaseId annotation(Placement(transformation(origin={100,23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput localTime(unit="s") annotation(Placement(transformation(origin={100,-23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput completed annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
protected
  Integer i;
initial equation
  for k in 2:n+1 loop assert(boundaries[k]>boundaries[k-1],"Phase boundaries must increase."); end for;
equation
  i=ScenarioLibrary.Utilities.Functions.TableIndex(time,boundaries);
  completed=i>n;
  phaseIndex=if completed then 0 else i;
  phaseId=if phaseIndex>0 then phaseIds[phaseIndex] else 0;
  localTime=if phaseIndex>0 then time-boundaries[phaseIndex] else 0;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-67,-30},{67,-30}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Rectangle(extent={{-60,-26},{-28,26}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-16,-26},{16,26}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{28,-26},{60,26}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Text(extent={{-60,-23},{-28,23}}, textString="1", textColor={0,0,127}, fontSize=0),
        Text(extent={{-16,-23},{16,23}}, textString="2", textColor={0,0,127}, fontSize=0),
        Text(extent={{28,-23},{60,23}}, textString="3", textColor={0,0,127}, fontSize=0),
        Line(points={{-60,49},{45,49}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{41.5,52},{47.2,46},{58.3,60.4}}, color={75,138,73}, thickness=1.5, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Ordered absolute phase schedule with an explicit completed state.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.IntegerOutput phaseIndex; Modelica.Blocks.Interfaces.IntegerOutput phaseId; Modelica.Blocks.Interfaces.RealOutput localTime(unit=\"s\"); Modelica.Blocks.Interfaces.BooleanOutput completed</p><p><b>Parameters</b> parameter Integer n(min=1)=2; parameter Modelica.Units.SI.Time boundaries[n+1]=linspace(0,n,n+1); parameter Integer phaseIds[n]={i for i in 1:n}</p><p><b>Behavior</b> Ordered absolute phase schedule with an explicit completed state</p><p><b>Initialization</b> The declared start values and initialization equations apply.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> phaseIndex, phaseId, localTime, completed</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.PhaseQualifiedWindows\">ScenarioLibrary.Examples.PhaseQualifiedWindows</a></p></html>"));
end PhaseSchedule;
