abstract class SelectClass {
  
  SelectClass() {
  }
  
  Button selectingButton(ArrayList<Button> buttons) {
    for (Button b: buttons) {
      if (b.judgeMouse()) return b;
    }
    return null;
  }
  
  void draw() {
  }
  
}
