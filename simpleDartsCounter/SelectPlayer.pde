class SelectPlayer extends SelectClass {
  
  ArrayList<Button> buttons;
  
  SelectPlayer() {
    super();
    buttons = new ArrayList<Button>();
    buttons.add(new Button(150, 400, 150, 1, color(150, 0, 0), color(255), Mode.Game501));
    buttons.add(new Button(350, 400, 150, 2, color(150, 0, 0), color(255), Mode.Game501));
    buttons.add(new Button(550, 400, 150, 3, color(150, 0, 0), color(255), Mode.Game501));
    buttons.add(new Button(750, 400, 150, 4, color(150, 0, 0), color(255), Mode.Game501));
  }
  
  void draw() {
    super.draw();
    fill(255);
    text("SELECT PLAYER", width/2, 150);
    for (Button b: buttons) b.draw();
  }
  
}
