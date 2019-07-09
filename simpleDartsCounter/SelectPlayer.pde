class SelectPlayer extends SelectClass {
  
  ArrayList<Button> buttons;
  Mode next;
  
  SelectPlayer(Mode next) {
    super();
    this.next = next;
    buttons = new ArrayList<Button>();
    color buttonColor = color(150);
    buttons.add(new Button(150, 400, 150, 1, buttonColor, color(0), next));
    buttons.add(new Button(350, 400, 150, 2, buttonColor, color(0), next));
    buttons.add(new Button(550, 400, 150, 3, buttonColor, color(0), next));
    buttons.add(new Button(750, 400, 150, 4, buttonColor, color(0), next));
  }
  
  void draw() {
    super.draw();
    fill(255);
    text("SELECT PLAYER", width/2, 150);
    for (Button b: buttons) b.draw();
  }
  
}
