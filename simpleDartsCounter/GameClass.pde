// ゲームを作成するときは，このクラスを継承する
abstract class GameClass {
  
  float topBarHeight;  // ゲーム名表示するトップバーの高さ
  String gameName;  // トップバーに表示するゲーム名
  
  int[] playerScores;  // 全プレイヤーの点数
  String[] inputScore;  // 入力された点数（各桁ずつ）
  int nowIndex;  // 入力欄の何桁目に入力するかを示すindex
  
  int nowPlayer;  // 点数入力ができるプレイヤーの番号
  int allPlayer;  // 全プレイヤーの人数
  int winner;  // ゲームに勝ったプレイヤーの番号
  
  int allRound;
  int nowRound;
  
  boolean isPlaying;  // ゲーム中か
  boolean isUpdated;  // スコア更新したか
  boolean isError;  // エラーが起きているか
  
  GameClass(int allPlayer, int allRound, int score, float topBarHeight, String gameName) {
    this.allPlayer = allPlayer;
    this.allRound = allRound;
    playerScores = new int[allPlayer];
    for (int i = 0; i < playerScores.length; i++) playerScores[i] = score;
    this.topBarHeight = topBarHeight;
    this.gameName = gameName;
    
    inputScore = new String[] {"", "", ""};
    nowIndex = 0;
    nowPlayer = 0;
    winner = 0;
    nowRound = 1;
    isPlaying = true;
    isUpdated = false;
  }
  
  // マウスクリックしたときに呼ばれ，カーソルが乗っているボタンがあれば返す
  Button selectingButton(ArrayList<Button> buttons) {
    for (Button b: buttons) {
      if (b.judgeMouse()) return b;
    }
    return null;
  }
  
  // 入力中，数字キーが押されたときに数字(String型)を追加する処理
  void addInput(String inputStr) {
    // エラー直後の修正では入力内容とエラーをリセット
    if (isError) resetInput();
    // 最大でも180点だから，4桁目は入力させない
    if (2 < nowIndex) return;
    // "0"から始まったら，以後"00"のように0を重複させない
    if (0 < nowIndex && inputScore[0].equals("0")) return;
    
    inputScore[nowIndex] = inputStr;
    nowIndex++;
  }
  
  // 入力中，BACKSPACEで1文字だけ消すときの処理
  void deleteInput() {
    if (0 < nowIndex) {
      inputScore[nowIndex-1] = "";
      nowIndex--;
    }
  }
  
  // プレイヤーが変わるときとエラーで入力し直すときに，入力していたスコアとエラーをリセット
  void resetInput() {
    inputScore = new String[] {"", "", ""};
    nowIndex = 0;
    isError = false;
  }
  
  // 各桁Stringで格納されているのを一つの整数値に変換(例: {"1","8","0"} -> 180)
  int convertToIntScore(String[] inputScore) {
    // 各桁intにしてArrayListに格納
    ArrayList<Integer> nums = new ArrayList<Integer>();
    for (int i = 0; i <= 2; i++) {
      if (inputScore[i].isEmpty()) break;
      nums.add(parseInt(inputScore[i]));
    }
    
    // 桁数に応じて，各桁に掛ける値を変える
    int score = 0;
    int numsSize = nums.size();
    for (int i = 0; i < numsSize; i++) {
      score += nums.get(i) * (int)pow(10, numsSize-(i+1));
    }
    return score;
  }
  
  // ENTERが押されたとき，入力されたスコアを使って更新
  void judgeScoreError() {
    // スコア未入力の時
    setError(inputScore[0].isEmpty() || 181 <= convertToIntScore(inputScore));
  }
  
  // Bustする点数か(01のみ呼び出せるようにする必要がある)
  boolean isBust(int roundScore) {
    int newScore = playerScores[nowPlayer] - roundScore;
    return newScore < 0;
  }
  
  // スコアの更新をし，更新できたか返す
  abstract boolean isScoreUpdated();
  
  // ゲームの終了条件を満たしているか
  abstract boolean isFinish();
  
  // ゲーム勝者の番号
  abstract int judgeWinner();
  
  // ゲーム終了時に呼ぶ
  void terminateGame() {
    winner = judgeWinner();
    isPlaying = false;
  }
  
  // エラー判定とエラー状態の更新
  void setError(boolean isError) {
    this.isError = isError;
  }
  
  void incrementRound() {
    nowRound++;
  }
  
  // プレイヤー交代時に呼ぶ
  void changePlayer() {
    if (isFinish()) {
      terminateGame();
      return;
    }
    if (nowPlayer == allPlayer-1) {
      nowPlayer = 0;
      incrementRound();
    } else {
      nowPlayer++;
    }
  }
  
  // 点数入力部分の描画
  void drawInputScore() {
    textSize(40);
    String score = "";
    for (String s: inputScore) {
      if (s.isEmpty()) break;
      score += s;
    }
    // スコア未入力時「Score」，勝者「Winner」表示
    if (score.isEmpty()) {
      // エラー時赤表示
      if (isError) {
        fill(255, 0, 0);
        text("Score", width*(nowPlayer*2+1)/(allPlayer*2), 450);
      } else {
        // ゲーム中は通常表示，終了時は勝者にWinner表示
        if (isPlaying) {
          fill(150);
          text("Score", width*(nowPlayer*2+1)/(allPlayer*2), 450);
        } else {
          fill(50);
          text("Winner", width*(winner*2+1)/(allPlayer*2), 450);
        }
      }
    } else {  // スコア入力中
      if (isError) {
        fill(255, 0, 0);
      } else {
        fill(150);
      }
      text(score, width*(nowPlayer*2+1)/(allPlayer*2), 450);
    }
  }
  
  // 各プレイヤーの持ち点表示
  void drawPlayerScore() {
    textSize(80);
    for (int i = 0; i < allPlayer; i++) {
      if (isPlaying) {
        if (i == nowPlayer) {
          fill(0);
        } else {
          fill(255);
        }
      } else {
        if (i == winner) {
          fill(0);
        } else {
          fill(255);
        }
      }
      text(playerScores[i], width*(i*2+1)/(allPlayer*2), 300);
    }
  }
  
  void drawPlayerBack() {
    // 現在のプレイヤーの背景のみ白で，入力したスコアを下部に表示
    // ゲーム終了時の勝者は緑
    if (isPlaying) {
      fill(255);
      rect(nowPlayer*(width/allPlayer), topBarHeight, width/allPlayer, height-topBarHeight);
    } else {
      fill(150, 255, 0);
      rect(winner*(width/allPlayer), topBarHeight, width/allPlayer, height-topBarHeight);
    }
  }
  
  void drawTopBar() {
    // トップバーの描画
    fill(50);
    rect(0, 0, width, topBarHeight);
    fill(255);
    textSize(40);
    text(gameName, width/2, topBarHeight/2);
    textSize(30);
    text("ROUND " + nowRound + "/" + allRound, 150, topBarHeight/2);
  }
  
  void draw() {
    drawTopBar();
    drawPlayerBack();
    drawPlayerScore();
    drawInputScore();
  }
  
}
