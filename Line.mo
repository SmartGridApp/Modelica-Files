model Line
  Buildings.Electrical.AC.OnePhase.Lines.Line line annotation(
    Placement(visible = true, transformation(origin = {0, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buildings.Electrical.AC.OnePhase.Interfaces.Terminal_n term_n annotation(
    Placement(visible = true, transformation(origin = {-94, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buildings.Electrical.AC.OnePhase.Interfaces.Terminal_p term_p annotation(
    Placement(visible = true, transformation(origin = {90, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(line.terminal_n, term_n);
  connect(line.terminal_p, term_p);
  annotation(
    uses(Buildings(version = "4.0.0")),
    Icon(graphics = {Ellipse(origin = {-93, 21}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-21, 15}, {21, -15}}, endAngle = 360), Ellipse(origin = {89, 21}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-21, 15}, {21, -15}}, endAngle = 360), Polygon(origin = {-2, 21}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points = {{-92, 15}, {-92, -15}, {92, -15}, {92, 15}, {-92, 15}})}));
end Line;