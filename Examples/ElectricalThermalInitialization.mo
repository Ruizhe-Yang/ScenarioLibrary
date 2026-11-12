within ScenarioLibrary.Examples;
model ElectricalThermalInitialization "Bind voltage, current and temperature in separate networks"
  extends Modelica.Icons.Example;
  parameter ScenarioLibrary.Initialization.ElectricalState initialElectrical(v_start=5,i_start=0.2);
  parameter ScenarioLibrary.Initialization.ThermalState initialThermal(T_start=310);
  Modelica.Electrical.Analog.Sources.ConstantVoltage capacitorSource(V=0) annotation(Placement(transformation(origin={-184,150},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor capacitorResistor(R=10) annotation(Placement(transformation(origin={-52,150},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(C=0.01,v(start=initialElectrical.v_start,fixed=initialElectrical.fixedV)) annotation(Placement(transformation(origin={76,150},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground capacitorGround annotation(Placement(transformation(origin={170,105},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage inductorSource(V=0) annotation(Placement(transformation(origin={-184,15},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor inductorResistor(R=10) annotation(Placement(transformation(origin={-52,15},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L=0.1,i(start=initialElectrical.i_start,fixed=initialElectrical.fixedI)) annotation(Placement(transformation(origin={76,15},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground inductorGround annotation(Placement(transformation(origin={170,-30},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature ambient(T=300) annotation(Placement(transformation(origin={-184,-130},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor heatPath(G=2) annotation(Placement(transformation(origin={-42,-130},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor thermal(C=100,T(start=initialThermal.T_start,fixed=initialThermal.fixedT)) annotation(Placement(transformation(origin={100,-115},extent={{-12,-12},{12,12}},rotation=0)));
equation
  connect(capacitorSource.p,capacitorResistor.p) annotation(Line(points={{-196,150},{-201,150},{-64,150}},color={0,0,255}));
  connect(capacitorResistor.n,capacitor.p) annotation(Line(points={{-40,150},{64,150}},color={0,0,255}));
  connect(capacitor.n,capacitorGround.p) annotation(Line(points={{88,150},{170,150},{170,117}},color={0,0,255}));
  connect(capacitorSource.n,capacitorGround.p) annotation(Line(points={{-172,150},{-167,150},{-167,122},{170,122},{170,117}},color={0,0,255}));
  connect(inductorSource.p,inductorResistor.p) annotation(Line(points={{-196,15},{-201,15},{-64,15}},color={0,0,255}));
  connect(inductorResistor.n,inductor.p) annotation(Line(points={{-40,15},{64,15}},color={0,0,255}));
  connect(inductor.n,inductorGround.p) annotation(Line(points={{88,15},{170,15},{170,-18}},color={0,0,255}));
  connect(inductorSource.n,inductorGround.p) annotation(Line(points={{-172,15},{-167,15},{-167,-13},{170,-13},{170,-18}},color={0,0,255}));
  connect(ambient.port,heatPath.port_a) annotation(Line(points={{-172,-130},{-54,-130}},color={191,0,0}));
  connect(heatPath.port_b,thermal.port) annotation(Line(points={{-30,-130},{100,-130},{100,-132},{100,-127}},color={191,0,0}));
  annotation(experiment(StartTime=0,StopTime=5,Interval=0.01,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-360,-240},{360,240}},preserveAspectRatio=true),graphics={Text(extent={{-180,202},{30,188}},textString="Capacitor voltage",textColor={34,61,73}),Text(extent={{-180,67},{30,53}},textString="Inductor current",textColor={34,61,73}),Text(extent={{-180,-68},{30,-82}},textString="Thermal state",textColor={34,61,73})}),
    Documentation(info="<html><p><b>Purpose</b> Bind voltage, current and temperature in separate networks</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> The three independent starting values are 5 V, 0.2 A and 310 K.</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> capacitor.v, inductor.i and thermal.T at initialization.</p></html>"));
end ElectricalThermalInitialization;
