within ScenarioLibrary.Utilities.Types;
type MissionState = enumeration(Idle "等待", Running "运行", Paused "暂停", Completed "完成", Aborted "中止", Recovery "恢复准备") "外部任务计划状态"
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-85,-85},{85,85}}, lineColor={128,128,128}, fillColor={160,160,164}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=18),
        Text(extent={{-68,68},{-14,20}}, textString="E", textColor={255,255,255}, fontSize=0),
        Rectangle(extent={{-54,-55},{-30,-24}}, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-12,-55},{12,-24}}, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{30,-55},{54,-24}}, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0)
      }),
    Documentation(info="<html>
<p>外部任务计划状态</p>
</html>"));
