class SelectGame extends SelectClass {
  
  ArrayList<Button> buttons;
  
  SelectGame() {
    super();
    buttons = new ArrayList<Button>();
    color fillColor = color(150);
    color textColor = color(0);
    buttons.add(new Button(250, 400, 150, 0, fillColor, textColor, Mode.GameCU));
    buttons.add(new Button(450, 400, 150, 301, fillColor, textColor, Mode.Game301));
    buttons.add(new Button(650, 400, 150, 501, fillColor, textColor, Mode.Game501));
  }
  
  void draw() {
    super.draw();
    fill(255);
    text("SELECT GAME", width/2, 150);
    for (Button b: buttons) b.draw();
  }
  
}
