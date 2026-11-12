within ScenarioLibrary.Operating;
block ValveOpeningProfile "按时段平滑开阀、运行与关阀"
  parameter Modelica.Units.SI.Time openAt = 1 "开始打开，s";
  parameter Modelica.Units.SI.Time closeAt = 6 "开始关闭，s";
  parameter Modelica.Units.SI.Time openingTime(min=Modelica.Constants.small) = 1 "打开过渡时间，s";
  parameter Modelica.Units.SI.Time closingTime(min=Modelica.Constants.small) = 1.5 "关闭过渡时间，s";
  parameter Real standbyOpening(min=0,max=1) = 0.05 "待机开度";
  parameter Real operatingOpening(min=0,max=1) = 0.85 "运行开度";
  Modelica.Blocks.Interfaces.RealOutput opening(min=0,max=1) "任务指令开度" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
protected
  Real up;
  Real down;
initial equation
  assert(openingTime > 0 and closingTime > 0 and closeAt >= openAt+openingTime and
    standbyOpening >= 0 and standbyOpening <= 1 and operatingOpening >= 0 and operatingOpening <= 1, "Invalid opening schedule.");
equation
  up = min(1,max(0,(time-openAt)/openingTime));
  down = min(1,max(0,(time-closeAt)/closingTime));
  opening = standbyOpening+(operatingOpening-standbyOpening)*(up^2*(3-2*up)-down^2*(3-2*down));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Polygon(points={{-24.48,32},{-24.48,56},{0,44},{-24.48,32}}, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Polygon(points={{24.48,32},{24.48,56},{0,44},{24.48,32}}, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{0,44},{0,64.16}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-8.16,64.16},{8.16,64.16}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-58,-39},{-55.273,-39},{-52.545,-39},{-49.818,-39},{-47.091,-39},{-44.364,-38.639},{-41.636,-36.593},{-38.909,-33.07},{-36.182,-28.449},{-33.455,-23.109},{-30.727,-17.427},{-28,-11.784},{-25.273,-6.557},{-22.545,-2.126},{-19.818,1.132},{-17.091,2.837},{-14.364,3},{-11.636,3},{-8.909,3},{-6.182,3},{-3.455,3},{-0.727,3},{2,3},{4.727,3},{7.455,3},{10.182,3},{12.909,3},{15.636,3},{18.364,3},{21.091,2.837},{23.818,1.132},{26.545,-2.126},{29.273,-6.557},{32,-11.784},{34.727,-17.427},{37.455,-23.109},{40.182,-28.449},{42.909,-33.07},{45.636,-36.593},{48.364,-38.639},{51.091,-39},{53.818,-39},{56.545,-39},{59.273,-39},{62,-39}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="ValveOpeningProfile")}),
    Documentation(info="<html><p><b>Purpose</b> 按时段平滑开阀、运行与关阀</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput opening(min=0,max=1) \"任务指令开度\"</p><p><b>Parameters</b> parameter Modelica.Units.SI.Time openAt = 1 \"开始打开，s\"; parameter Modelica.Units.SI.Time closeAt = 6 \"开始关闭，s\"; parameter Modelica.Units.SI.Time openingTime(min=Modelica.Constants.small) = 1 \"打开过渡时间，s\"; parameter Modelica.Units.SI.Time closingTime(min=Modelica.Constants.small) = 1.5 \"关闭过渡时间，s\"; parameter Real standbyOpening(min=0,max=1) = 0.05 \"待机开度\"; parameter Real operatingOpening(min=0,max=1) = 0.85 \"运行开度\"</p><p><b>Behavior</b> 按时段平滑开阀、运行与关阀</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.LoadAndCommandSchedules\">ScenarioLibrary.Examples.LoadAndCommandSchedules</a></p>
<p>按时段平滑开阀、运行与关阀</p>
<p>专业分类为 ExternalInputs.Flow。</p>
<p>接口与方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealOutput opening(min=0,max=1) \"任务指令开度\"</code></li>
</ul>
<p>参数、类型、默认值及约束</p>
<ul>
<li><code>Modelica.Units.SI.Time openAt = 1 \"开始打开，s\"</code></li>
<li><code>Modelica.Units.SI.Time closeAt = 6 \"开始关闭，s\"</code></li>
<li><code>Modelica.Units.SI.Time openingTime(min=Modelica.Constants.small) = 1 \"打开过渡时间，s\"</code></li>
<li><code>Modelica.Units.SI.Time closingTime(min=Modelica.Constants.small) = 1.5 \"关闭过渡时间，s\"</code></li>
<li><code>Real standbyOpening(min=0,max=1) = 0.05 \"待机开度\"</code></li>
<li><code>Real operatingOpening(min=0,max=1) = 0.85 \"运行开度\"</code></li>
</ul>
<p><b>时序与基准行为</b> 过渡为三次平滑曲线。两个过渡不重叠，端点斜率均为零。</p>
<p><b>最小用法</b> 直接接 ValveLinear.opening，或作为真实执行器的计划目标。 <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">FluidOperatingScenario</a> 展示同域接线。</p>
<p><b>适用边界</b> 输出定义为命令开度。质量流量仍由阀特性和实际压差决定。</p>
</html>"));
end ValveOpeningProfile;
