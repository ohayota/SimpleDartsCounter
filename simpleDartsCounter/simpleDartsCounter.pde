// SimpleDartsCounter (ver1.1)
// © 2019 Yota Nakamura

import java.util.Arrays;

Mode mode;
SelectGame selectGame;
SelectPlayer selectPlayer;
SelectReturn selectReturn;
GameCU gameCU;
Game301 game301;
Game501 game501;
Editor editor;

boolean DEBUG_MODE = false;

enum Mode {
  SelectGame,
  SelectPlayer,
  SelectReturn,
  GameCU,
  Game301,
  Game501,
  Editor
}

void setup() {
  
  if (DEBUG_MODE) {
    println("<<Debug Mode>> setup");
  } else {
    println("<<Run Mode>> setup");
  }
  
  size(900, 600);
  textAlign(CENTER, CENTER);
  ellipseMode(CENTER);
  textSize(40);
  frameRate(60);
  noStroke();
  
  mode = Mode.SelectGame;
  selectGame = new SelectGame();
  
}

void draw() {
  
  if (DEBUG_MODE) {
    println("<<Debug Mode>> draw");
    
    testGame501();
    
    println("All tests passed!");
    exit();
  } else {
    println("<<Run Mode>> draw");
    
    background(0);
  
    switch (mode) {
      case SelectGame:
        selectGame.draw();
        break;
      case SelectPlayer:
        selectPlayer.draw();
        break;
      case SelectReturn:
        selectReturn.draw();
        break;
      case GameCU:
        gameCU.draw();
        break;
      case Game301:
        game301.draw();
        break;
      case Game501:
        game501.draw();
        break;
      case Editor:
        editor.draw();
        break;
      default:
        break;
    }
  }
  
  //println(mode);
  
}
