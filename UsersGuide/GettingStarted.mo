within ScenarioLibrary.UsersGuide;
class GettingStarted "Load the library and inspect a first scenario"
  extends Modelica.Icons.Information;
  annotation(Documentation(info="<html><p>Load Modelica 4.0.0, then open ScenarioLibrary/package.mo. Open <a href=\"modelica://ScenarioLibrary.Examples.MultiphaseMission\">Examples.MultiphaseMission</a> and run its stored experiment.</p><p>Inspect schedule.phaseIndex, schedule.localTime, demand and finished. The four phases use boundaries {0,1,3,7,10}. Then open <a href=\"modelica://ScenarioLibrary.Examples.ReusableScenario\">ReusableScenario</a> to compare two responses driven by one planned input.</p></html>"));
end GettingStarted;
