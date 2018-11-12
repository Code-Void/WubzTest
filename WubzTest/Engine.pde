public class Engine {
  private Point p1, p2;
  private int r = 0, g = 0, b = 255;
  private boolean engineOn = false;
  private float acceleration = 0.8;
  private float distanceBetweenPoints;

  public Engine(Point p1, Point p2) {
    this.p1 = p1;
    this.p2 = p2;

    distanceBetweenPoints = p1.getPosition().dist(p2.getPosition());
  }

  public void update() {
    if (engineOn) {
      r = 255;
      g = 0;
      b = 0;
    } else {
      r = 0; 
      g = 0; 
      b = 255;
    }
    stroke(r, g, b);
    line(p1.getPosition().x, p1.getPosition().y - 5, p2.getPosition().x, p2.getPosition().y + 5);
  }

  public void activate() {
    PVector accel_vector = PVector.sub(p2.getPosition(), p1.getPosition());
    accel_vector.normalize();
    accel_vector.mult(acceleration);

    p1.setAttraction(accel_vector);
    p2.setAttraction(accel_vector);
  }

  public boolean toofar2() { // testing if its too far to remove
    if (distanceBetweenPoints > sizeco*2.5) return true;
    return false;
  }

  public void setEngineStatus(boolean status) {
    this.engineOn = status;
  }
}
