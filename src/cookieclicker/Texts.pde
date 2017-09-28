public class Texts {
  String str;
  int x; 
  int y;
  boolean alive = false;
  int start;
  int speed;
  // cread a new class for Texts to cascade texts together - eg, the +1s

  public Texts (String string, int x_pos, int y_pos, int startTime) {
    str = string;
    x = x_pos;
    y = y_pos;
    start = startTime;
    speed = 2;
  }

  void write() {
    if (alive == true) {
      text(str, x, y);
    }
  }

  void move() {
    y = y - speed;
  }
}