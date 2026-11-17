within ScenarioLibrary.Utilities.Types;
type OperatingMode = enumeration(Off "Stopped", Standby "Ready without active operation", Startup "Starting operation", Rated "Rated operation", PartLoad "Part-load operation", Shutdown "Stopping operation", Maintenance "Maintenance condition") "Named planned operating conditions"
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-85,-85},{85,85}}, lineColor={128,128,128}, fillColor={160,160,164}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=18),
        Text(extent={{-68,68},{-14,20}}, textString="E", textColor={255,255,255}, fontSize=0),
        Line(points={{-43,-55},{-43,-27}}, color={255,255,255}, thickness=2, pattern=LinePattern.Solid),
        Line(points={{-4,-55},{-4,3}}, color={255,255,255}, thickness=2, pattern=LinePattern.Solid),
        Line(points={{35,-55},{35,36}}, color={255,255,255}, thickness=2, pattern=LinePattern.Solid)
      }),
    Documentation(info="<html><p>Enumerate planned operating conditions: Off, Standby, Startup, Rated, PartLoad, Shutdown and Maintenance. These labels describe a selected condition; they do not assess whether the physical system has reached it.</p></html>"));
