ArrayList<Point> points = new ArrayList<Point>();
ArrayList<Connection> conn = new ArrayList<Connection>();
ArrayList<Engine> engines = new ArrayList<Engine>();
ArrayList<Engine> reng = new ArrayList<Engine>();
ArrayList<Engine> leng = new ArrayList<Engine>();
ArrayList<Bomb> bombs = new ArrayList<Bomb>();

boolean slowmo = false;

int w = 10, h = 10;
int sizeco = 50;
int offsety = 700, offsetx = 800;

void setup() {
  fullScreen();

  for (int j = 0; j < h; j++) {
    for (int i = 0; i < w; i++) {
      points.add(new Point(sizeco *i+offsetx, sizeco *j+offsety, sizeco/10));
    }
  }

  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h-1; j++) {
      conn.add(new Connection(points.get(j*w+i), points.get((j+1)*w+i), sizeco ));
    }
  }

  for (int i = 0; i < w-1; i++) {
    for (int j = 0; j < h; j++) {
      conn.add(new Connection(points.get(j*w+i), points.get(j*w+(i+1)), sizeco ));
    }
  }

  for (int i = 0; i < w-1; i++) {
    for (int j = 0; j < h-1; j++) {
      conn.add(new Connection(points.get(j*w+i), points.get((j+1)*w+(i+1)), sizeco *sqrt(2)));
      conn.add(new Connection(points.get(j*w+(i+1)), points.get((j+1)*w+i), sizeco *sqrt(2)));
    }
  }

  //Adding Engines
  for (int i = 0; i < w; i++) {
    engines.add(new Engine(points.get((h-1)*w+i), points.get((h-2)*w+i)));
    //engines.add(new Engine(points.get((h-4)*w+i), points.get((h-5)*w+i)));
  }

  //making left and right engines...not efficient...
  for (Engine e : engines)  if (e.p1.getPosition().x < points.get(0).getPosition().x + (sizeco *(w/2))) reng.add(e);
  for (Engine e : engines)  if (e.p1.getPosition().x > points.get(0).getPosition().x + (sizeco *(w/2)) -1) leng.add(e);

  bombs.add(new Bomb(points.get((int)random(0, points.size()-1))));
  bombs.add(new Bomb(points.get((int)random(0, points.size()-1))));
}

void draw() {
  if (slowmo) frameRate(10);
  else frameRate(60);
  background(0);

  //text to display stuff
  fill(255);
  text("Press 's' to toggle Slow Motion", 10, 15);
  text("Press 'b' to toggle Bombs", 10, 40);
  for (Point p : points) p.update();

  for (Connection c : conn) {
    if (c.toofar()) {
      conn.remove(c);
      break;
    }

    c.update();
  }

  for (Engine e : engines) {
    if (e.toofar2()) {
      engines.remove(e);
      break;
    }

    e.update();
  }

  for (Bomb b : bombs) b.update();
}

void keyPressed() {
  if (key == CODED) { 
    if (!slowmo) {
      if (keyCode == UP) {
        for (Engine e : engines) {
          e.activate();
          e.setEngineStatus(true);
        }
      } else if (keyCode == LEFT) {
        for (Engine e : leng) {
          e.activate();
          e.setEngineStatus(true);
        }
      } else if (keyCode == RIGHT) {
        for (Engine e : reng) {
          e.activate();
          e.setEngineStatus(true);
        }
      }
    }
  } else {
    if (key == 's') {
      slowmo = !slowmo;
    } else if (key == 'b') {
      for (Bomb b : bombs) {
        b.activate();
      }
      bombs.clear();
    }
  }
}

void keyReleased() {
  for (Engine e : engines) e.setEngineStatus(false);
}
