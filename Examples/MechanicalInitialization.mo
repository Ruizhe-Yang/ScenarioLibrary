within ScenarioLibrary.Examples;
model MechanicalInitialization "Bind independent mechanical initial states"
  extends Modelica.Icons.Example;
  parameter ScenarioLibrary.Initialization.TranslationalState translation(s_start=0.1,v_start=0);
  parameter ScenarioLibrary.Initialization.RotationalState rotation(phi_start=0.2,w_start=0);
  Modelica.Mechanics.Translational.Components.Fixed translationalReference annotation(Placement(transformation(origin={-140,63},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Mechanics.Translational.Components.Spring translationalSpring(c=10) annotation(Placement(transformation(origin={-25,63},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Mechanics.Translational.Components.Mass translationalHost(m=1,s(start=translation.s_start,fixed=translation.fixedS),v(start=translation.v_start,fixed=translation.fixedV)) annotation(Placement(transformation(origin={102,63},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Mechanics.Rotational.Components.Fixed rotationalReference annotation(Placement(transformation(origin={-140,-65},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Mechanics.Rotational.Components.Spring rotationalSpring(c=8) annotation(Placement(transformation(origin={-25,-65},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Mechanics.Rotational.Components.Inertia rotationalHost(J=0.4,phi(start=rotation.phi_start,fixed=rotation.fixedPhi),w(start=rotation.w_start,fixed=rotation.fixedW)) annotation(Placement(transformation(origin={102,-65},extent={{-12,-12},{12,12}},rotation=0)));
equation
  connect(translationalReference.flange,translationalSpring.flange_a) annotation(Line(points={{-140,63},{-37,63}},color={0,127,0}));
  connect(translationalSpring.flange_b,translationalHost.flange_a) annotation(Line(points={{-13,63},{90,63}},color={0,127,0}));
  connect(rotationalReference.flange,rotationalSpring.flange_a) annotation(Line(points={{-140,-65},{-37,-65}},color={0,0,0}));
  connect(rotationalSpring.flange_b,rotationalHost.flange_a) annotation(Line(points={{-13,-65},{90,-65}},color={0,0,0}));
  annotation(experiment(StartTime=0,StopTime=5,Interval=0.01,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true),graphics={Text(extent={{-153,124},{117,110}},textString="Translational initial position and velocity",textColor={34,61,73}),Text(extent={{-155,-3},{115,-17}},textString="Angular initial position and velocity",textColor={34,61,73})}),
    Documentation(info="<html><p><b>Purpose</b> Bind independent mechanical initial states</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> The translational and rotational initial values are 0.1 m and 0.2 rad with zero velocities. Turning off a fixed flag makes its start value an initial guess.</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> translationalHost.s and .v, rotationalHost.phi and .w at time zero.</p></html>"));
end MechanicalInitialization;
