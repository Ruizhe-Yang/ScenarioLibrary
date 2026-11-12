within ScenarioLibrary.Utilities.Types;
type OperatingMode = enumeration(Off "停机", Standby "待机", Startup "启动", Rated "额定", PartLoad "部分负载", Shutdown "停机过程", Maintenance "维护") "计划工况的具名状态"
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-85,-85},{85,85}}, lineColor={128,128,128}, fillColor={160,160,164}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=18),
        Text(extent={{-68,68},{-14,20}}, textString="E", textColor={255,255,255}, fontSize=0),
        Line(points={{-43,-55},{-43,-27}}, color={255,255,255}, thickness=2, pattern=LinePattern.Solid),
        Line(points={{-4,-55},{-4,3}}, color={255,255,255}, thickness=2, pattern=LinePattern.Solid),
        Line(points={{35,-55},{35,36}}, color={255,255,255}, thickness=2, pattern=LinePattern.Solid)
      }),
    Documentation(info="<html>
<p>表示场景预定工况。</p>
</html>"));
