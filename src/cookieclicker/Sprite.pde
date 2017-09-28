public class Sprite {
  PImage img;
  int x; int y;
  int w; int h;
  
  public Sprite (PImage imgs, int x_pos, int y_pos, int widths, int heights) {
    img = imgs;
    x = x_pos;
    y = y_pos;
    w = widths;
    h = heights;
  }
  
  void draw() {
   image(img, x, y, w, h); 
  }
}