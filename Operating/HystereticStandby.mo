within ScenarioLibrary.Operating;
block HystereticStandby "Hysteretic selection of rated and standby operation"
  parameter Real enterRun = 0.6 "Demand threshold for entering rated operation";
  parameter Real enterStandby = 0.3 "Demand threshold for returning to standby";
  parameter Boolean initialRun = false "Initial running state when demand lies inside the hysteresis band";
  Modelica.Blocks.Interfaces.RealInput plannedDemand "Planned demand used to select the operating mode" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  output ScenarioLibrary.Utilities.Types.OperatingMode mode "Selected rated or standby operating mode";
  Modelica.Blocks.Interfaces.BooleanOutput running "The selected mode is rated operation" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
initial equation
  assert(enterStandby < enterRun, "Operating demand thresholds must be ordered.");
equation
  when {initial(),plannedDemand >= enterRun,plannedDemand <= enterStandby} then
    running = if plannedDemand >= enterRun then true elseif plannedDemand <= enterStandby then false else initialRun;
  end when;
  mode = if running then ScenarioLibrary.Utilities.Types.OperatingMode.Rated else ScenarioLibrary.Utilities.Types.OperatingMode.Standby;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-57,-28},{23,-28},{23,32},{61,32}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-57,-28},{-20,-28},{-20,32},{61,32}}, color={128,128,128}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{-10,32},{10,32}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{10,-28},{-10,-28}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="HystereticStandby")}),
    Documentation(info="<html><p>Select running at or above <code>enterRun</code> and standby at or below <code>enterStandby</code>. Between the thresholds the previous state is retained; at initialisation within the band, <code>initialRun</code> selects the state.</p><p>The thresholds must be ordered strictly. <code>mode</code> is <code>OperatingMode.Rated</code> while running and <code>OperatingMode.Standby</code> otherwise. The input is the planned demand used to choose the scenario state.</p></html>"));
end HystereticStandby;
