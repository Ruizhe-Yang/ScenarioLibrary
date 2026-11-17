within ScenarioLibrary.UsersGuide;
class Limitations "Initialisation and environmental modelling limits"
  extends Modelica.Icons.Information;
  annotation(Documentation(info="<html><p>Initial-state records do not impose equations until their fields are bound to a model. Select independent fixed initial states consistent with the model equations. An initial value and a runtime command serve different roles.</p><p>Respect the stated table sizes, ordering, interpolation and endpoint rules. Environmental models have individual validity ranges and coordinate conventions. Fluid signal bundles and ideal physical reservoirs provide different interfaces.</p><p>The library supplies deterministic scenario relations. It does not infer completion criteria from the model; schedule markers and explicit status logic must be interpreted using their declared inputs and equations.</p></html>"));
end Limitations;
