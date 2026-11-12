within ScenarioLibrary.Timing;
block MissionLifecycle "以外部事件标记管理任务启停暂停和恢复"
  Modelica.Blocks.Interfaces.BooleanInput start "Start or restart pulse" annotation(Placement(transformation(extent={{-106,76},{-94,88}}), iconTransformation(extent={{-106,76},{-94,88}})));
  Modelica.Blocks.Interfaces.BooleanInput pause "Pause pulse" annotation(Placement(transformation(extent={{-106,43},{-94,55}}), iconTransformation(extent={{-106,43},{-94,55}})));
  Modelica.Blocks.Interfaces.BooleanInput resume "Resume pulse" annotation(Placement(transformation(extent={{-106,10},{-94,22}}), iconTransformation(extent={{-106,10},{-94,22}})));
  Modelica.Blocks.Interfaces.BooleanInput abort "Abort pulse" annotation(Placement(transformation(extent={{-106,-22},{-94,-10}}), iconTransformation(extent={{-106,-22},{-94,-10}})));
  Modelica.Blocks.Interfaces.BooleanInput complete "External completion marker" annotation(Placement(transformation(extent={{-106,-55},{-94,-43}}), iconTransformation(extent={{-106,-55},{-94,-43}})));
  Modelica.Blocks.Interfaces.BooleanInput recover "Recovery preparation marker after abort" annotation(Placement(transformation(extent={{-106,-88},{-94,-76}}), iconTransformation(extent={{-106,-88},{-94,-76}})));
  output ScenarioLibrary.Utilities.Types.MissionState state;
  Modelica.Blocks.Interfaces.BooleanOutput running annotation(Placement(transformation(extent={{94,42},{106,54}}), iconTransformation(extent={{94,42},{106,54}})));
  Modelica.Blocks.Interfaces.IntegerOutput runCount(start=0,fixed=true) annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
  Modelica.Blocks.Interfaces.RealOutput elapsedActive(unit="s") annotation(Placement(transformation(extent={{94,-54},{106,-42}}), iconTransformation(extent={{94,-54},{106,-42}})));
protected
  Modelica.Units.SI.Time totalActive(start=0,fixed=true);
  discrete Modelica.Units.SI.Time elapsedAtStart(start=0,fixed=true);
equation
  running = state==ScenarioLibrary.Utilities.Types.MissionState.Running;
  der(totalActive) = if running then 1 else 0;
  when {initial(),change(runCount)} then
    elapsedAtStart = totalActive;
  end when;
  elapsedActive = totalActive-elapsedAtStart;
algorithm
  when initial() then
    state := if start and not abort then ScenarioLibrary.Utilities.Types.MissionState.Running else ScenarioLibrary.Utilities.Types.MissionState.Idle;
    runCount := if start and not abort then 1 else 0;
  elsewhen abort then
    state := if pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Running or pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Paused then ScenarioLibrary.Utilities.Types.MissionState.Aborted else pre(state);
  elsewhen complete then
    state := if pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Running or pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Paused then ScenarioLibrary.Utilities.Types.MissionState.Completed else pre(state);
  elsewhen pause then
    state := if pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Running then ScenarioLibrary.Utilities.Types.MissionState.Paused else pre(state);
  elsewhen recover then
    state := if pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Aborted then ScenarioLibrary.Utilities.Types.MissionState.Recovery else pre(state);
  elsewhen resume then
    state := if pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Paused and not abort then ScenarioLibrary.Utilities.Types.MissionState.Running else pre(state);
  elsewhen start then
    if not abort and (pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Idle or pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Completed or pre(state)==ScenarioLibrary.Utilities.Types.MissionState.Recovery) then
      state := ScenarioLibrary.Utilities.Types.MissionState.Running;
      runCount := pre(runCount)+1;
    end if;
  end when;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-60,12},{-18,46}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Polygon(points={{-49,20},{-49,38},{-32,29},{-49,20}}, lineColor={75,138,73}, fillColor={75,138,73}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Rectangle(extent={{17,12},{59,46}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{29,20},{29,38}}, color={64,64,64}, thickness=1.5, pattern=LinePattern.Solid),
        Line(points={{45,20},{45,38}}, color={64,64,64}, thickness=1.5, pattern=LinePattern.Solid),
        Rectangle(extent={{-20,-48},{20,-14}}, lineColor={64,64,64}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-17,29},{15,29}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{38,10},{38,-30},{21,-30}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{-21,-30},{-40,-30},{-40,10}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 以外部事件标记管理任务启停暂停和恢复</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.BooleanInput start \"Start or restart pulse\"; Modelica.Blocks.Interfaces.BooleanInput pause \"Pause pulse\"; Modelica.Blocks.Interfaces.BooleanInput resume \"Resume pulse\"; Modelica.Blocks.Interfaces.BooleanInput abort \"Abort pulse\"; Modelica.Blocks.Interfaces.BooleanInput complete \"External completion marker\"; Modelica.Blocks.Interfaces.BooleanInput recover \"Recovery preparation marker after abort\"; output ScenarioLibrary.Utilities.Types.MissionState state; Modelica.Blocks.Interfaces.BooleanOutput running; Modelica.Blocks.Interfaces.IntegerOutput runCount(start=0,fixed=true); Modelica.Blocks.Interfaces.RealOutput elapsedActive(unit=\"s\")</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 以外部事件标记管理任务启停暂停和恢复</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.PhaseQualifiedWindows\">ScenarioLibrary.Examples.PhaseQualifiedWindows</a></p>
<p>以外部事件标记管理任务启停暂停和恢复</p>
<p><b>行为</b> 中止、完成、暂停、恢复准备、继续、启动按此顺序处理同刻上升沿。继续保留局部时间，重启清零。中止后先进入恢复准备再接受重启。</p>
<p><b>最小用法</b> 从任务时间表或宿主提供六类布尔标记。以 running 和 elapsedActive 驱动受暂停影响的任务通路。</p>
<p><b>适用边界</b> 状态属于场景记录。阈值保护、执行器状态和实际系统恢复由宿主或保护链处理。</p>
<p>接口及方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.BooleanInput start \"Start or restart pulse\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanInput pause \"Pause pulse\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanInput resume \"Resume pulse\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanInput abort \"Abort pulse\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanInput complete \"External completion marker\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanInput recover \"Recovery preparation marker after abort\"</code></li>
<li><code>output ScenarioLibrary.Utilities.Types.MissionState state</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput running</code></li>
<li><code>Modelica.Blocks.Interfaces.IntegerOutput runCount(start=0,fixed=true)</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput elapsedActive(unit=\"s\")</code></li>
</ul>
<p><a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">MultiPhaseSystemScenario</a> 提供同域宿主参考。</p>
</html>"));
end MissionLifecycle;
