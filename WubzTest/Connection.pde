public class Connection {
  private Point p1, p2;
  private float attractionforce = 0.03;
  private float normalDist;
  private float pdistanceBetweenPoints;
  private float distanceBetweenPoints;

  public Connection(Point p1, Point p2, float normalDist) {
    this.p1 = p1;
    this.p2 = p2;
    this.normalDist = normalDist;
    this.pdistanceBetweenPoints = normalDist;
  }

  public void update() {
    PVector displacement = PVector.sub(p1.getPosition(), p2.getPosition());
    distanceBetweenPoints = p1.getPosition().dist(p2.getPosition());

    displacement.normalize();
    PVector dup = displacement.copy();
    displacement.mult(distanceBetweenPoints - normalDist);
    displacement.mult(attractionforce);

    p2.setAttraction(displacement);
    p1.setAttraction(PVector.sub(new PVector(0, 0), displacement));

    dup.mult(-(distanceBetweenPoints - pdistanceBetweenPoints) * 0.03);

    p1.setAttraction(dup);
    p2.setAttraction(PVector.sub(new PVector(0, 0), dup));

    pdistanceBetweenPoints = distanceBetweenPoints;

    stroke(255);
    line(p1.getPosition().x, p1.getPosition().y, p2.getPosition().x, p2.getPosition().y);
  }


  public Point getFirstPoint() {
    return this.p1;
  }

  public Point getSecondPoint() {
    return this.p2;
  }

  public float getDistanceBetweenPoints() {
    return this.distanceBetweenPoints ;
  }

  public boolean toofar() { // testing if its too far to remove
    if (distanceBetweenPoints > sizeco*2.5) return true;
    return false;
  }
}
