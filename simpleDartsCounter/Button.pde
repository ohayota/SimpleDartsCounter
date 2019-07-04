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
  
  void next() {
    mode = next;
  }
  
  void draw() {
    fill(fillColor);
    // マウスカーソルが乗ると暗く小さくなり，離れると戻る
    // 押すと少し小さくなる（沈む）
    if (mousePressed) {
      if (judgeMouse()) {
        ellipse(x, y, nowSize*0.9, nowSize*0.9);
        fill(0, 100);
        ellipse(x, y, nowSize*0.9, nowSize*0.9);
      }
    } else {
      if (judgeMouse()) {
        if (size-20 < nowSize) nowSize -= 4;
        ellipse(x, y, nowSize, nowSize);
        fill(0, 50);
        ellipse(x, y, nowSize, nowSize);
      } else {
        if (nowSize < size) nowSize += 4;
        ellipse(x, y, nowSize, nowSize);
      }
    }
    // ボタン名をボタンの中心に表示
    fill(textColor);
    text(number, x, y);
  }
  
}
