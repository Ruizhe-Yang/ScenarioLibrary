within ScenarioLibrary.Environment;
model GravitySetting "Tangential gravitational load for a prescribed grade"
  parameter Modelica.Units.SI.Mass carriedMass(min=0) = 10 "Mass used to calculate the gravitational load";
  parameter Modelica.Units.SI.Acceleration gravity(min=0) = Modelica.Constants.g_n "Nonnegative local gravity magnitude";
  Modelica.Blocks.Interfaces.RealInput grade(unit="rad") "Downhill grade in the positive direction of motion" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange "Translational body connection" annotation(Placement(transformation(extent={{-7,-107},{7,-93}}), iconTransformation(extent={{-7,-107},{7,-93}})));
  Modelica.Blocks.Interfaces.RealOutput force(unit="N") "Applied tangential gravitational force" annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
protected
  Modelica.Mechanics.Translational.Sources.Force load;
initial equation
  assert(carriedMass >= 0 and gravity >= 0, "Gravity and participating mass must be nonnegative.");
equation
  assert(noEvent(abs(grade) <= Modelica.Constants.pi/2), "Grade must be within a half turn centered at level.");
  force = carriedMass*gravity*sin(grade);
  load.f = force;
  connect(load.flange, flange);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Line(points={{-66,-45},{62,23}}, color={64,64,64}, thickness=1, pattern=LinePattern.Solid),
        Polygon(points={{-22,-22},{18,-1},{1,31},{-39,10},{-22,-22}}, lineColor={64,64,64}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-4,8},{-4,-65}}, color={64,64,64}, thickness=1, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{10,-35},{36,-61}}, textString="g", textColor={64,64,64}, fontSize=0),
        Line(points={{0,-68},{0,-100}}, color={64,64,64}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true), graphics={Text(extent={{-96,99},{96,88}}, textColor={30,104,76}, textString="GravitySetting")}),
    Documentation(info="<html><p>Apply the external force <code>carriedMass*gravity*sin(grade)</code> through a translational force source. Positive grade denotes downhill in the positive direction of motion. The force output reports the applied load command.</p><p>Connect the flange to the loaded body and supply grade in radians within [-pi/2,pi/2]. carriedMass specifies the mass used to calculate gravity; this model does not add that mass to the connected mechanical system.</p></html>"));
end GravitySetting;
