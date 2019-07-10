void keyTyped() {
  switch (mode) {
    case GameCU:
      if (gameCU.isPlaying) {
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
            gameCU.addInput(String.valueOf(key));
            break;
          case BACKSPACE:
            gameCU.deleteInput();
            break;
          case ENTER:
            if (gameCU.isScoreUpdated()) {
              gameCU.resetInput();
              gameCU.changePlayer();
            }
            break; //<>//
          default:
            break;
        }
      } else {
        if (key == ENTER) gameCU = new GameCU(gameCU.allPlayer);
      }
      break;
    case Game301:
      if (game301.isPlaying) {
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
            game301.addInput(String.valueOf(key));
            break;
          case BACKSPACE:
            game301.deleteInput();
            break;
          case ENTER:
            if (game301.isScoreUpdated()) {
              game301.resetInput();
              game301.changePlayer();
            }
            break;
          default:
            break;
        }
      } else {
        if (key == ENTER) game301 = new Game301(game301.allPlayer);
      }
      break;
    case Game501:
      if (game501.isPlaying) {
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
            game501.addInput(String.valueOf(key));
            break;
          case BACKSPACE:
            game501.deleteInput();
            break;
          case ENTER:
            if (game501.isScoreUpdated()) {
              game501.resetInput();
              if (game501.isFinish()) {
                game501.terminateGame();
              } else {
                game501.changePlayer();
              }
            }
            break;
          default:
            break;
        }
      } else {
        if (key == ENTER) game501 = new Game501(game501.allPlayer);
      }
      break;
    default:
      break;
  }
}

void keyReleased() {
  if (mode == Mode.Game501) game501.isUpdated = false;
}
