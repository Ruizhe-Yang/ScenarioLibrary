within ScenarioLibrary.Examples;
model MechanicalInitialization "Bind independent translational and rotational initial states"
  extends Modelica.Icons.Example;
  parameter ScenarioLibrary.Initialization.TranslationalState translation(s_start=0.1,v_start=0) "Initial position and velocity with independent fixed flags";
  parameter ScenarioLibrary.Initialization.RotationalState rotation(phi_start=0.2,w_start=0) "Initial angle and angular velocity with independent fixed flags";
  Modelica.Mechanics.Translational.Components.Fixed translationalReference  "Fixed translational reference" annotation(Placement(transformation(origin={-140,63},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Mechanics.Translational.Components.Spring translationalSpring(c=10)  "Spring restoring the mass towards the reference" annotation(Placement(transformation(origin={-25,63},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Mechanics.Translational.Components.Mass translationalHost(m=1,s(start=translation.s_start,fixed=translation.fixedS),v(start=translation.v_start,fixed=translation.fixedV))  "Mass with explicitly bound initial position and velocity" annotation(Placement(transformation(origin={102,63},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Mechanics.Rotational.Components.Fixed rotationalReference  "Fixed angular reference" annotation(Placement(transformation(origin={-140,-65},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Mechanics.Rotational.Components.Spring rotationalSpring(c=8)  "Spring restoring the inertia towards the reference" annotation(Placement(transformation(origin={-25,-65},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Mechanics.Rotational.Components.Inertia rotationalHost(J=0.4,phi(start=rotation.phi_start,fixed=rotation.fixedPhi),w(start=rotation.w_start,fixed=rotation.fixedW))  "Inertia with explicitly bound initial angle and speed" annotation(Placement(transformation(origin={102,-65},extent={{-12,-12},{12,12}},rotation=0)));
equation
  connect(translationalReference.flange,translationalSpring.flange_a) annotation(Line(points={{-140,63},{-37,63}},color={0,127,0}));
  connect(translationalSpring.flange_b,translationalHost.flange_a) annotation(Line(points={{-13,63},{90,63}},color={0,127,0}));
  connect(rotationalReference.flange,rotationalSpring.flange_a) annotation(Line(points={{-140,-65},{-37,-65}},color={0,0,0}));
  connect(rotationalSpring.flange_b,rotationalHost.flange_a) annotation(Line(points={{-13,-65},{90,-65}},color={0,0,0}));
  annotation(experiment(StartTime=0,StopTime=5,Interval=0.01,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true),graphics={Text(extent={{-153,124},{117,110}},textString="Translational initial position and velocity",textColor={34,61,73}),Text(extent={{-155,-3},{115,-17}},textString="Angular initial position and velocity",textColor={34,61,73})}),
    Documentation(info="<html><p>Bind a <code>TranslationalState</code> record to the position and velocity modifiers of a spring-supported mass, and a <code>RotationalState</code> record to the angle and speed of a spring-supported inertia. The two mechanical systems are independent.</p><p>The configured initial position is 0.1 m and the initial angle is 0.2 rad, with zero initial velocities. Plot <code>translationalHost.s</code>, <code>translationalHost.v</code>, <code>rotationalHost.phi</code> and <code>rotationalHost.w</code>. Each record supplies both the start value and its fixed flag.</p></html>"));
end MechanicalInitialization;
