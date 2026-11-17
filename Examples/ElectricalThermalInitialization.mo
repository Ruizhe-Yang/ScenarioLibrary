within ScenarioLibrary.Examples;
model ElectricalThermalInitialization "Bind initial electrical and thermal states in separate networks"
  extends Modelica.Icons.Example;
  parameter ScenarioLibrary.Initialization.ElectricalState initialElectrical(v_start=5,i_start=0.2) "Initial voltage and current with independent fixed flags";
  parameter ScenarioLibrary.Initialization.ThermalState initialThermal(T_start=310) "Initial temperature and fixed flag";
  Modelica.Electrical.Analog.Sources.ConstantVoltage capacitorSource(V=0)  "Zero-voltage source closing the capacitor circuit" annotation(Placement(transformation(origin={-184,150},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor capacitorResistor(R=10)  "Resistance dissipating the stored capacitor energy" annotation(Placement(transformation(origin={-52,150},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(C=0.01,v(start=initialElectrical.v_start,fixed=initialElectrical.fixedV))  "Capacitor with explicitly bound initial voltage" annotation(Placement(transformation(origin={76,150},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground capacitorGround  "Potential reference for the capacitor circuit" annotation(Placement(transformation(origin={170,105},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage inductorSource(V=0)  "Zero-voltage source closing the inductor circuit" annotation(Placement(transformation(origin={-184,15},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor inductorResistor(R=10)  "Resistance dissipating the stored inductor energy" annotation(Placement(transformation(origin={-52,15},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L=0.1,i(start=initialElectrical.i_start,fixed=initialElectrical.fixedI))  "Inductor with explicitly bound initial current" annotation(Placement(transformation(origin={76,15},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground inductorGround  "Potential reference for the inductor circuit" annotation(Placement(transformation(origin={170,-30},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature ambient(T=300)  "Prescribed environment temperature" annotation(Placement(transformation(origin={-184,-130},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor heatPath(G=2)  "Conductance between environment and thermal capacity" annotation(Placement(transformation(origin={-42,-130},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor thermal(C=100,T(start=initialThermal.T_start,fixed=initialThermal.fixedT))  "Thermal capacity with explicitly bound initial temperature" annotation(Placement(transformation(origin={100,-115},extent={{-12,-12},{12,12}},rotation=0)));
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
    Documentation(info="<html><p>Use records to set a capacitor voltage of 5 V, an inductor current of 0.2 A and a thermal capacity temperature of 310 K. The capacitor and inductor each have their own resistive circuit; the thermal capacity exchanges heat with a 300 K boundary.</p><p>Plot <code>capacitor.v</code>, <code>inductor.i</code> and <code>thermal.T</code>. The record fields are explicitly bound to the state start values and fixed flags. The nominal decay time constants are 0.1 s, 0.01 s and 50 s respectively.</p></html>"));
end ElectricalThermalInitialization;
