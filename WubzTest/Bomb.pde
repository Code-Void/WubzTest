public class Bomb {
  private Point p;

  public Bomb(Point p) {
    this.p = p;
  }

  public void update() {
    noStroke();
    fill(0, 255, 0);
    ellipse(p.getPosition().x, p.getPosition().y, sizeco/5, sizeco/5);
  }

  public void activate() {
    PVector explosion = new PVector(random(5), random(5));
    p.setAttraction(explosion);
  }
}
