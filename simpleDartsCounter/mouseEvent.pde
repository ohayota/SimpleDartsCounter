void mouseClicked() {
  
  Button selecting;
  switch (mode) {
    case SelectGame:
      selecting = selectGame.selectingButton(selectGame.buttons);
      if (selecting != null) selecting.next();
      break;
    case SelectPlayer:
      selecting = selectPlayer.selectingButton(selectPlayer.buttons);
      if (selecting != null) {
        game501 = new Game501(selecting.number);
        selecting.next();
      }
      break;
    case SelectReturn:
      selecting = selectReturn.selectingButton(selectReturn.buttons);
      if (selecting != null) selecting.next();
      break;
    case GameCU:
      selecting = selectPlayer.selectingButton(gameCU.buttons);
      if (selecting != null) selecting.next();
      break;
    case Game301:
      selecting = selectPlayer.selectingButton(game301.buttons);
      if (selecting != null) selecting.next();
      break;
    case Game501:
      selecting = selectPlayer.selectingButton(game501.buttons);
      if (selecting != null) selecting.next();
      break;
    default:
      break;
  }
  
}
