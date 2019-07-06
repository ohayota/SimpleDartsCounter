// 選択画面を作成するときは，このクラスを継承する
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
