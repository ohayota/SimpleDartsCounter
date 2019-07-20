class SelectPlayer extends SelectClass {
  
  ArrayList<Button> buttons;
  Mode next;
  
  SelectPlayer(Mode next) {
    super();
    this.next = next;
    buttons = new ArrayList<Button>();
    color fillColor = color(150);
    color textColor = color(0);
    buttons.add(new Button(150, 400, 150, 1, fillColor, textColor, next));
    buttons.add(new Button(350, 400, 150, 2, fillColor, textColor, next));
    buttons.add(new Button(550, 400, 150, 3, fillColor, textColor, next));
    buttons.add(new Button(750, 400, 150, 4, fillColor, textColor, next));
  }
  
  void draw() {
    super.draw();
    fill(255);
    textSize(60);
    text("SELECT PLAYER", width/2, 150);
    textSize(45);
    for (Button b: buttons) b.draw();
  }
  
}
