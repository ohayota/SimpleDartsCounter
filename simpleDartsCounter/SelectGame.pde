class SelectGame extends SelectClass {
  
  ArrayList<Button> buttons;
  
  SelectGame() {
    super();
    buttons = new ArrayList<Button>();
    buttons.add(new Button(350, 400, 150, 301, color(150), color(0), Mode.Game301));
    buttons.add(new Button(550, 400, 150, 501, color(150), color(0), Mode.Game501));
  }
  
  void draw() {
    super.draw();
    fill(255);
    text("SELECT GAME", width/2, 150);
    for (Button b: buttons) b.draw();
  }
  
}
