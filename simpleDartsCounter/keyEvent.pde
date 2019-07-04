void keyPressed() {
  if (mode == Mode.Game501 && game501.isPlaying) {
    switch (key) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        game501.addNum(String.valueOf(key));
        break;
      case BACKSPACE:
        game501.deleteNum();
        break;
      case ENTER:
        boolean isUpdated = game501.updateScore(); //<>//
        if (isUpdated) { //<>//
          game501.resetNum();
          if (game501.isPlaying) game501.changePlayer();
        }
        break;
      default:
        break;
    }
  }
}

void keyReleased() {
  if (mode == Mode.Game501) game501.isUpdated = false;
}
