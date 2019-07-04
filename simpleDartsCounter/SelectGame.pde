class SelectGame extends SelectClass {
  
  ArrayList<Button> buttons;
  
  SelectGame() {
    super();
    buttons = new ArrayList<Button>();
    buttons.add(new Button(450, 400, 150, 501, color(150, 0, 0), color(255), Mode.SelectPlayer));
  }
  
  void draw() {
    super.draw();
    fill(255);
    text("SELECT GAME", width/2, 150);
    for (Button b: buttons) b.draw();
  }
  
}
