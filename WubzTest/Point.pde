public class Point {
  private int size;
  private PVector position, speed, gravity, attraction;

  public Point(float xpos, float ypos, int size) {
    this.position = new PVector(xpos, ypos);
    speed = new PVector(0, 0);
    gravity = new PVector(0, 0.07); //0.07
    attraction = new PVector(0, 0);
    this.size = size;
  }

  public PVector getPosition() { //Getter for the position 
    return position;
  }

  public PVector getSpeed() {
    return speed;
  }

  public void update() { //Updating the points -- applying gravity and drawing the points
    physics();


    stroke(255);
    ellipse(position.x, position.y, size, size);
  }

  public void setAttraction(PVector attraction) { // a setter to set the attraction
    this.attraction.add(attraction);
  }

  //FUNCTION TO APPLY GRAVITY -- basically a given example
  private void physics() {

    speed.add(gravity); //adding the gravity force to the speed
    speed.add(attraction); //and attraction

    attraction.set(0.0, 0.0);

    position.add(speed); //adding the speed ot the position


    if ((position.x >= width) || (position.x <= 0)) {
      speed.x = speed.x * -1; // if it hit the wall invers the x speed
    }
    if (position.y > height && position.y > 0) { // slowly decreade the speed in y
      speed.y = speed.y * -0.95;
      position.y = height;
    } else if (position.y <= 0 ) { // hitting the ceiling
      speed.y = speed.y * -0.95;
      position.y = 0;
    }
  }
}
