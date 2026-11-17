within ScenarioLibrary.Environment;
block Atmosphere "Dry-air troposphere temperature, pressure and density"
Modelica.Blocks.Interfaces.RealInput height(unit="m")  "Height above the atmospheric reference level" annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput T(unit="K")  "Calculated absolute air temperature" annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput p(unit="Pa")  "Calculated absolute air pressure" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput rho(unit="kg/m3")  "Calculated dry-air density" annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
equation
  assert(height>=0 and height<=11000,"Troposphere height outside [0,11000] m.");
  T=288.15-0.0065*height;
  p=101325*(T/288.15)^(9.80665/(287.05287*0.0065));
  rho=p/(287.05287*T);
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,55},{-62,-40},{65,-40}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-58,42},{-55.273,38.655},{-52.545,35.428},{-49.818,32.318},{-47.091,29.32},{-44.364,26.432},{-41.636,23.651},{-38.909,20.974},{-36.182,18.398},{-33.455,15.92},{-30.727,13.539},{-28,11.25},{-25.273,9.052},{-22.545,6.942},{-19.818,4.917},{-17.091,2.975},{-14.364,1.114},{-11.636,-0.67},{-8.909,-2.378},{-6.182,-4.012},{-3.455,-5.576},{-0.727,-7.071},{2,-8.499},{4.727,-9.863},{7.455,-11.164},{10.182,-12.405},{12.909,-13.588},{15.636,-14.714},{18.364,-15.786},{21.091,-16.806},{23.818,-17.775},{26.545,-18.696},{29.273,-19.569},{32,-20.397},{34.727,-21.182},{37.455,-21.924},{40.182,-22.627},{42.909,-23.29},{45.636,-23.917},{48.364,-24.508},{51.091,-25.065},{53.818,-25.589},{56.545,-26.081},{59.273,-26.544},{62,-26.978}}, color={0,0,127}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-58,42},{-55.273,41.075},{-52.545,40.15},{-49.818,39.225},{-47.091,38.3},{-44.364,37.375},{-41.636,36.45},{-38.909,35.525},{-36.182,34.6},{-33.455,33.675},{-30.727,32.75},{-28,31.825},{-25.273,30.9},{-22.545,29.975},{-19.818,29.05},{-17.091,28.125},{-14.364,27.2},{-11.636,26.275},{-8.909,25.35},{-6.182,24.425},{-3.455,23.5},{-0.727,22.575},{2,21.65},{4.727,20.725},{7.455,19.8},{10.182,18.875},{12.909,17.95},{15.636,17.025},{18.364,16.1},{21.091,15.175},{23.818,14.25},{26.545,13.325},{29.273,12.4},{32,11.475},{34.727,10.55},{37.455,9.625},{40.182,8.7},{42.909,7.775},{45.636,6.85},{48.364,5.925},{51.091,5},{53.818,4.075},{56.545,3.15},{59.273,2.225},{62,1.3}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{-61,78},{65,55}}, textString="p, T, rho", textColor={0,0,127}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Calculate a dry-air tropospheric state from height. Temperature follows <code>T=288.15-0.0065*height</code>; pressure follows the corresponding constant-lapse-rate power law and density uses the ideal-gas relation with gas constant 287.05287 J/(kg.K).</p><p>The height input must lie between 0 and 11000 m. Outputs are absolute temperature, absolute pressure and density. The reference pressure is 101325 Pa at zero height.</p></html>"));
end Atmosphere;
