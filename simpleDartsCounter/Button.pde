class Button {
  
  float x, y, size, nowSize;
  int number;
  color fillColor, textColor;
  Mode next;
  
  Button(float x, float y, float size, int number, color fillColor, color textColor, Mode next) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.nowSize = size;
    this.number = number;
    this.fillColor = fillColor;
    this.textColor = textColor;
    this.next = next;
  }
  
  // ボタン上にマウスが乗っていればtrue(三平方の定理)
  boolean judgeMouse() {
    return pow(mouseX-x, 2) + pow(mouseY-y, 2) < pow(size/2, 2);
  }
  
  void toNext() {
    mode = next;
  }
  
  void draw() {
    fill(fillColor);
    // マウスカーソルが乗ると明るく大きくなり，離れると戻る
    // 押すと少し小さくなる（沈む）
    if (mousePressed) {
      if (judgeMouse()) {
        ellipse(x, y, nowSize*0.9, nowSize*0.9);
        fill(0, 100);
        ellipse(x, y, nowSize*0.9, nowSize*0.9);
      } else {
        fill(fillColor);
        ellipse(x, y, nowSize, nowSize);
      }
    } else {
      if (judgeMouse()) {
        if (nowSize < size+20) nowSize += 4;
        fill(255);
        ellipse(x, y, nowSize, nowSize);
      } else {
        if (size < nowSize) nowSize -= 4;
        ellipse(x, y, nowSize, nowSize);
      }
    }
    // ボタン名をボタンの中心に表示
    fill(textColor);
    if (mode == Mode.SelectGame) {
      String gameName = "";
      switch (next) {
        case GameCU:
          gameName = "CU";
          break;
        case Game301:
          gameName = "301";
          break;
        case Game501:
          gameName = "501";
          break;
        default:
          break;
      }
      text(gameName, x, y);
    } else {
      text(number, x, y);
    }
  }
  
}
