public class Connection {
  private Point p1, p2;
  private float attractionforce = 2.0;

  public Connection(Point p1, Point p2) {
    this.p1 = p1;
    this.p2 = p2;
  }

  public void update() {
    if (attracts(p1, p2)) {
      if (p1.getPosition().dist(p2.getPosition()) > 75) p1.setAttraction(new PVector(((p1.getPosition().x - p2.getPosition().x)/p1.getPosition().dist(p2.getPosition()))*-attractionforce, ((p1.getPosition().y - p2.getPosition().y)/p1.getPosition().dist(p2.getPosition()))*-attractionforce));
      else if (p1.getPosition().dist(p2.getPosition()) <= 75 && p1.getPosition().dist(p2.getPosition()) >= 71) p1.setAttraction(new PVector(0.0, 0.0));
      else p1.setAttraction(new PVector(((p1.getPosition().x - p2.getPosition().x)/p1.getPosition().dist(p2.getPosition()))*attractionforce, ((p1.getPosition().y - p2.getPosition().y)/p1.getPosition().dist(p2.getPosition()))*attractionforce));
    }

    stroke(255);
    line(p1.getPosition().x, p1.getPosition().y, p2.getPosition().x, p2.getPosition().y);
  }


  public Point getFirstPoint() {
    return this.p1;
  }

  public Point getSecondPoint() {
    return this.p2;
  }
}
