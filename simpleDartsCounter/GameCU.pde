class GameCU extends GameClass {
  
  ArrayList<Button> buttons;
  
  GameCU(int player) {
    super(player, 0, 50, "COUNT-UP");
    buttons = new ArrayList<Button>();
  }
  
  void draw() {
    super.draw();
    for (Button b: buttons) b.draw();
  }
  
}
