
public class Point {
  private int size;
  private PVector position, speed, gravity, attraction;

  public Point(float xpos, float ypos, int size) {
    this.position = new PVector(xpos, ypos);
    speed = new PVector(0, 0);
    gravity = new PVector(0, 0.2);
    attraction = new PVector(0, 0);
    this.size = size;
  }

  public PVector getPosition() { //Getter for the position 
    return this.position;
  }

  public void update() { //Updating the points -- applying gravity and drawing the points
    applyGrav();

    position.add(attraction); // apply the necessary attraction

    stroke(255);
    ellipse(position.x, position.y, size, size);
  }

  public void setAttraction(PVector attraction) { // a setter to set the attraction
    this.attraction = attraction;
  }

  //FUNCTION TO APPLY GRAVITY -- basically a given example
  private void applyGrav() {
    position.add(speed); //adding the speed ot the position

    speed.add(gravity); //adding the gravity force to the speed

    if ((position.x > width) || (position.x < 0)) {
      speed.x = speed.x * -1; // if it hit the wall invers the x speed
    }
    if (position.y > height) { // slowly decreade the speed in y
      speed.y = speed.y * -0.95;
      position.y = height;
    }
  }
}
