within ScenarioLibrary.Initialization;
record ElectricalState "Electrical voltage and current initialization choices"
  extends Modelica.Icons.Record;
Modelica.Units.SI.Voltage v_start=0;
Modelica.Units.SI.Current i_start=0;
Boolean fixedV=true;
Boolean fixedI=true;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-100,48},{100,48}}, color={108,88,49}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-57.4464,-5},{-33.6512,-5}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-22.6688,-5},{1.1264,-5}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-33.6512,-17.8128},{-33.6512,7.8128}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-22.6688,-17.8128},{-22.6688,7.8128}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{0.5808,-5},{9.636,-5},{9.636,-5},{9.7291,-3.4016},{10.0051,-1.8647},{10.4535,-0.4483},{11.0568,0.7931},{11.792,1.8121},{12.6306,2.5693},{13.5405,3.0354},{14.487,3.1928},{15.4334,3.0354},{16.3434,2.5693},{17.182,1.8121},{17.9172,0.7931},{18.5205,-0.4483},{18.9689,-1.8647},{19.2449,-3.4016},{19.338,-5},{19.338,-5},{19.4311,-3.4016},{19.7071,-1.8647},{20.1555,-0.4483},{20.7588,0.7931},{21.494,1.8121},{22.3327,2.5693},{23.2426,3.0354},{24.189,3.1928},{25.1355,3.0354},{26.0453,2.5693},{26.884,1.8121},{27.6192,0.7931},{28.2225,-0.4483},{28.6709,-1.8647},{28.9469,-3.4016},{29.04,-5},{29.04,-5},{29.1331,-3.4016},{29.4091,-1.8647},{29.8575,-0.4483},{30.4608,0.7931},{31.196,1.8121},{32.0347,2.5693},{32.9445,3.0354},{33.891,3.1928},{34.8375,3.0354},{35.7473,2.5693},{36.586,1.8121},{37.3212,0.7931},{37.9245,-0.4483},{38.3729,-1.8647},{38.6489,-3.4016},{38.742,-5},{38.742,-5},{38.8351,-3.4016},{39.1111,-1.8647},{39.5595,-0.4483},{40.1628,0.7931},{40.898,1.8121},{41.7366,2.5693},{42.6466,3.0354},{43.593,3.1928},{44.5395,3.0354},{45.4494,2.5693},{46.288,1.8121},{47.0232,0.7931},{47.6265,-0.4483},{48.0749,-1.8647},{48.3509,-3.4016},{48.444,-5},{57.4992,-5}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Text(extent={{-70,80},{70,52}}, textString="v0, i0", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Electrical voltage and current initialization choices.</p><p><b>Interfaces</b> The declared record fields or function arguments form the interface.</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Electrical voltage and current initialization choices</p><p><b>Initialization</b> This record only stores bindings. Apply its fields as modifiers to the intended host variables.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Choose independent initial constraints appropriate to the host. A start guess is distinct from a fixed initial value.</p><p><b>Observables</b> Public outputs and the stated input conditions.</p><p><b>Example</b> <a href=\"modelica://ScenarioLibrary.Examples.MechanicalInitialization\">ScenarioLibrary.Examples.MechanicalInitialization</a></p></html>"));
end ElectricalState;
