void mouseClicked() {
  
  Button selecting = null;
  switch (mode) {
    case SelectGame:
      selecting = selectGame.selectingButton(selectGame.buttons);
      break;
    case SelectPlayer:
      selecting = selectPlayer.selectingButton(selectPlayer.buttons);
      switch (selecting.next) {
        case GameCU:
          gameCU = new GameCU(selecting.number);
          break;
        case Game301:
          game301 = new Game301(selecting.number);
          break;
        case Game501:
          game501 = new Game501(selecting.number);
          break;
        default:
          break;
      }
      break;
    case SelectReturn:
      selecting = selectReturn.selectingButton(selectReturn.buttons);
      break;
    case GameCU:
      selecting = selectPlayer.selectingButton(gameCU.buttons);
      break;
    case Game301:
      selecting = selectPlayer.selectingButton(game301.buttons);
      break;
    case Game501:
      selecting = selectPlayer.selectingButton(game501.buttons);
      break;
    default:
      break;
  }
  if (selecting != null) selecting.toNext();
  
}
