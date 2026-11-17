within ScenarioLibrary.Timing;
block TaskStatus "Declared task state with abort and completion priority"
Modelica.Blocks.Interfaces.BooleanInput start  "Task start request" annotation(Placement(transformation(origin={-100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanInput complete  "External task completion request" annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanInput abort  "Task abort request with highest priority" annotation(Placement(transformation(origin={-100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,-70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput running  "True only when status is Running" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
  output ScenarioLibrary.Utilities.Types.TaskState status(start=ScenarioLibrary.Utilities.Types.TaskState.Idle,fixed=true) "Declared task state";
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
    Documentation(info="<html><p>Update <code>status</code> at initialisation and at rising events on <code>start</code>, <code>complete</code> or <code>abort</code>. At each such event, the current abort level has priority. Completion is accepted when complete is true and either start is true or the previous status was Running; otherwise a true start selects Running.</p><p>Unaccepted events retain the previous status. Simultaneous start and completion select Completed unless abort is true. <code>running</code> is true only for the Running state. These are externally declared task transitions.</p></html>"));
end TaskStatus;
