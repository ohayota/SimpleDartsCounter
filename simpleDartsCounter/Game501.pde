class Game501 extends GameClass {
  
  ArrayList<Button> buttons;
  
  Game501(int player) {
    super(player, 501, 50, "501");
    buttons = new ArrayList<Button>();
  }
  
  void draw() {
    super.draw();
    for (Button b: buttons) b.draw();
  }
  
}
