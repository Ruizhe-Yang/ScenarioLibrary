within ScenarioLibrary.Utilities.Views;
block PhaseLoad "Fixed four-phase load view"
Modelica.Blocks.Interfaces.IntegerInput phaseIndex  "Ordinal phase for the fixed four-stage profile" annotation(Placement(transformation(origin={-100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput localTime(unit="s")  "Nonnegative elapsed time within the current phase" annotation(Placement(transformation(origin={-100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,-70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput demand  "Planned load from the fixed phase relation" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
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
    Documentation(info="<html><p>Map the supplied phase index and local time to a fixed load profile: phase 1 gives zero, phase 2 rises linearly to one over 2 s, phase 3 gives one and phase 4 falls from one to zero over 3 s. Every other phase index gives zero.</p><p>Supply nonnegative phase-local time. The rise is capped only above at one and the fall only below at zero. This view has fixed timing constants and is used by the multiphase example.</p></html>"));
end PhaseLoad;
