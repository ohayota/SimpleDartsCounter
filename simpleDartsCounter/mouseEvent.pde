void mousePressed() {
  
}

void mouseClicked() {
  
  Button selecting = null;
  switch (mode) {
    case SelectGame:
      selecting = selectGame.selectingButton(selectGame.buttons);
      // プレイヤー選択後のゲームモードを記憶しておく
      if (selecting != null) { //<>// //<>//
        selectPlayer = new SelectPlayer(selecting.next); //<>// //<>//
        mode = Mode.SelectPlayer;
      }
      break;
    case SelectPlayer:
      selecting = selectPlayer.selectingButton(selectPlayer.buttons);
      if (selecting != null) { //<>// //<>//
        switch (selecting.next) {
          case GameCU:
            gameCU = new GameCU(selecting.number);
            break;
          case Game301: //<>// //<>//
            game301 = new Game301(selecting.number);
            break;
          case Game501: //<>// //<>//
            game501 = new Game501(selecting.number); //<>// //<>//
            break;
          default:
            break;
        }
        selecting.toNext(); //<>// //<>//
      }
      break;
    case SelectReturn:
      selecting = selectReturn.selectingButton(selectReturn.buttons);
      if (selecting != null) selecting.toNext();
      break;
    case GameCU:
      selecting = selectPlayer.selectingButton(gameCU.buttons);
      if (selecting != null) selecting.toNext();
      break;
    case Game301:
      selecting = selectPlayer.selectingButton(game301.buttons);
      if (selecting != null) selecting.toNext();
      break;
    case Game501:
      selecting = selectPlayer.selectingButton(game501.buttons);
      if (selecting != null) selecting.toNext();
      break;
    default:
      break;
  }
  
}
