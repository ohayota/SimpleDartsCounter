class Game301 extends GameClass {
  
  ArrayList<Button> buttons;
  
  Game301(int player) {
    super(player, 301, 50, "301");
    buttons = new ArrayList<Button>();
  }
  
  void draw() {
    super.draw();
    for (Button b: buttons) b.draw();
  }
  
}
