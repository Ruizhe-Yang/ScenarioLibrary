within ScenarioLibrary.UsersGuide;
class Conventions "Time references, record bindings and signal meaning"
  extends Modelica.Icons.Information;
  annotation(Documentation(info="<html><p>Apply record fields explicitly to the receiving start values and initialisation options. Use the declared units and connector orientation; a generic scalar profile takes its physical meaning from the receiving interface.</p><p>Read the selected block's time reference. Absolute schedules, enable-restarted profiles, retriggerable clocks and pauseable mission clocks have different restart rules. Phase indices are positions in a schedule; phase identifiers are configurable labels.</p><p>Half-open windows include their start and exclude their end. A planned completion or arrival flag reports the schedule relation; connect an explicit measured condition when the application requires confirmation of physical achievement.</p></html>"));
end Conventions;
