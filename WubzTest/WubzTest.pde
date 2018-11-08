ArrayList<Point> points = new ArrayList<Point>();
ArrayList<Connection> conn = new ArrayList<Connection>();

void setup() {
  size(800, 600);

  //for (int i = 0; i < 226; i+=75) {
  //  for (int j = 0; j < 226; j+=75) {
  //    points.add(new Point(i, j, 10));
  //  }
  //}

  points.add(new Point(250, 10, 10));
  points.add(new Point(250, 84, 10));
}

void draw() {
  background(0);
  println(conn.size());

  stroke(255);
  for (Point p : points) {
    p.update();
    for (Point p2 : points) {
      for (Connection c : conn) {
        if (!p.equals(p2) && !conn.contains(c) && attracts(p, p2)) {
          conn.add(new Connection(p, p2));
        } else if (!p.equals(p2) && !conn.contains(c) && !attracts(p, p2)) {
          conn.remove(c);
        }
      }
    }
  }

  for (Connection c : conn) c.update();
}

void mousePressed() {
  points.add(new Point(mouseX, mouseY, 10));
}

public boolean attracts(Point op, Point p) { //function in order to find if the points should attract each other
  if (op.getPosition().dist(p.getPosition()) <= 200) return true; 
  return false;
}
