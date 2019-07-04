class SelectReturn extends SelectClass {
  
  ArrayList<Button> buttons;
  
  SelectReturn() {
    super();
    buttons = new ArrayList<Button>();
    buttons.add(new Button(450, 400, 150, 0, color(0, 150, 0), color(255), Mode.SelectPlayer));
  }
  
  void draw() {
    super.draw();
    fill(255);
    text("SELECT RETURN", width/2, 150);
    for (Button b: buttons) b.draw();
  }
  
}
