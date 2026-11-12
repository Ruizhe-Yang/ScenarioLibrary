within ScenarioLibrary.Utilities.Views;
block PhaseLoad "Display a planned phase-qualified load"
Modelica.Blocks.Interfaces.IntegerInput phaseIndex annotation(Placement(transformation(origin={-100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput localTime(unit="s") annotation(Placement(transformation(origin={-100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,-70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput demand annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
equation
  demand=if phaseIndex==1 then 0 elseif phaseIndex==2 then min(1,localTime/2)
    elseif phaseIndex==3 then 1 elseif phaseIndex==4 then max(0,1-localTime/3) else 0;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,-30},{-35,-30},{-12,35},{23,35},{49,-30},{64,-30}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-35,-43},{-35,53}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Dash),
        Line(points={{-12,-43},{-12,53}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Dash),
        Line(points={{23,-43},{23,53}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Dash),
        Line(points={{49,-43},{49,53}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Dash),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Display a planned phase-qualified load.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.IntegerInput phaseIndex; Modelica.Blocks.Interfaces.RealInput localTime(unit=\"s\"); Modelica.Blocks.Interfaces.RealOutput demand</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Display a planned phase-qualified load</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> demand</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">ScenarioLibrary.Examples.MultiphaseMission</a></p></html>"));
end PhaseLoad;
