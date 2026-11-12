within ScenarioLibrary.Timing;
block TaskStatus "Declared task transitions with abort priority"
Modelica.Blocks.Interfaces.BooleanInput start annotation(Placement(transformation(origin={-100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanInput complete annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanInput abort annotation(Placement(transformation(origin={-100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,-70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput running annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
  output ScenarioLibrary.Utilities.Types.TaskState status(start=ScenarioLibrary.Utilities.Types.TaskState.Idle,fixed=true);
algorithm
  when {initial(),start,complete,abort} then
    if abort then status:=ScenarioLibrary.Utilities.Types.TaskState.Aborted;
    elseif complete and (start or pre(status)==ScenarioLibrary.Utilities.Types.TaskState.Running) then status:=ScenarioLibrary.Utilities.Types.TaskState.Completed;
    elseif start then status:=ScenarioLibrary.Utilities.Types.TaskState.Running;
    else status:=pre(status); end if;
  end when;
equation
  running=status==ScenarioLibrary.Utilities.Types.TaskState.Running;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-63,8},{-23,42}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Polygon(points={{-53,14},{-53,36},{-33,25},{-53,14}}, lineColor={75,138,73}, fillColor={75,138,73}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-21,25},{18,25}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Rectangle(extent={{21,8},{61,42}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{28.75,25},{37.3,16},{53.95,37.6}}, color={75,138,73}, thickness=1.5, pattern=LinePattern.Solid),
        Rectangle(extent={{-19,-55},{19,-17}}, lineColor={64,64,64}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-41,5},{-41,-36},{-20,-36}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{39,5},{39,-36},{20,-36}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{-8,-47},{8,-25}}, color={191,0,0}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-8,-25},{8,-47}}, color={191,0,0}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Declared task transitions with abort priority.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.BooleanInput start; Modelica.Blocks.Interfaces.BooleanInput complete; Modelica.Blocks.Interfaces.BooleanInput abort; Modelica.Blocks.Interfaces.BooleanOutput running; output ScenarioLibrary.Utilities.Types.TaskState status(start=ScenarioLibrary.Utilities.Types.TaskState.Idle,fixed=true)</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Abort takes precedence over completion and start. Completion takes precedence over a simultaneous start.</p><p><b>Initialization</b> The declared start values and initialization equations apply.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> running</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.PhaseQualifiedWindows\">ScenarioLibrary.Examples.PhaseQualifiedWindows</a></p></html>"));
end TaskStatus;
