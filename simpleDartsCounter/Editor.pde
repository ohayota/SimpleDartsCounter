class Editor {
  
  String[] inputScore;
  int nowIndex;
  int nowPlayer;
  int allPlayer;
  int winner;
  boolean isPlaying;
  boolean isUpdated;
  boolean isError;
  ArrayList<Integer> playerScores;
  
  Editor(int allPlayer) {
    inputScore = new String[] {"", "", ""};
    nowIndex = 0;
    nowPlayer = 0;
    this.allPlayer = allPlayer;
    isPlaying = true;
    isUpdated = false;
    playerScores = new ArrayList<Integer>();
    for (int i = 0; i < allPlayer; i++) playerScores.add(501);
  }
  
  void addNum(char num) {
    if (isUpdated) return;
    // エラー直後の修正では初めから入力
    if (isError) resetNum();
    // 4桁目は入力させない
    if (2 < nowIndex) return;
    // "0"から始まった時，"00"のように0を重複させない
    if (0 < nowIndex && inputScore[0].equals("0")) return;
    
    inputScore[nowIndex] = String.valueOf(num);
    if (nowIndex <= 2) nowIndex++;
  }
  
  void deleteNum() {
    if (isUpdated) return;
    if (0 < nowIndex) {
      inputScore[nowIndex-1] = "";
      nowIndex--;
    }
  }
  
  void resetNum() {
    inputScore = new String[] {"", "", ""};
    nowIndex = 0;
    isError = false;
  }
  
  boolean updateScore() {
    // スコア未入力の時
    if (inputScore[0].isEmpty()) {
      isError = true;
      return false;
    }
    // 現在のスコアから入力したスコアを引く
    ArrayList<Integer> nums = new ArrayList<Integer>();
    // スコア入力は1桁ごとのStringだったのでint型にする
    for (int i = 0; i <= 2; i++) {
      if (inputScore[i].isEmpty()) break; //<>// //<>//
      nums.add(parseInt(inputScore[i])); //<>// //<>//
    } //<>// //<>//
    // 一つの数字にする
    int roundScore; //<>// //<>//
    switch (nums.size()) { //<>// //<>//
      case 1:
        roundScore = nums.get(0);
        break;
      case 2:
        roundScore = nums.get(0)*10 + nums.get(1);
        break;
      case 3:
        roundScore = nums.get(0)*100 + nums.get(1)*10 + nums.get(2);
        break;
      default:
        return false;
    }
    // 3本で180点を超えることは不可能だからエラー
    if (180 < roundScore) {
      isError = true;
      return false;
    } else {
      isError = false;
      int newScore = playerScores.get(nowPlayer) - roundScore;
      if (newScore < 0) return true;
      playerScores.set(nowPlayer, newScore);
      if (newScore == 0) {
        winner = nowPlayer;
        isPlaying = false;
      }
      return true;
    }
  }
  
  void changePlayer() {
    if (nowPlayer+1 == allPlayer) {
      nowPlayer = 0;
    } else {
      nowPlayer++;
    }
  }
  
  void drawRoundScore() {
    String score = "";
    for (String s: inputScore) {
      if (s.isEmpty()) break;
      score += s;
    }
    // スコア未入力のとき「Score」と表示し，エラー時は赤表示
    if (score.isEmpty()) {
      if (isError) {
        fill(255, 0, 0);
        text("Score", width*(nowPlayer*2+1)/(allPlayer*2), 450);
      } else {
        if (!isPlaying) {
          fill(255, 255, 0);
          text("Winner", width*(nowPlayer*2+1)/(allPlayer*2), 450);
        } else {
          fill(100);
          text("Score", width*(nowPlayer*2+1)/(allPlayer*2), 450);
        }
      }
    } else {
      if (isError) {
        fill(255, 0, 0);
      } else {
        fill(255);
      }
      text(score, width*(nowPlayer*2+1)/(allPlayer*2), 450);
    }
  }
  
  void draw() {
    // 現在のプレイヤーの背景のみ緑で，入力したスコアを下部に表示
    // ゲーム終了時の勝者は赤
    if (isPlaying) {
      fill(0, 50, 0);
    } else {
      fill(100, 0, 0);
    }
    rect(nowPlayer*(width/allPlayer), 40, width/allPlayer, height-40);
    drawRoundScore();
    // 各プレイヤーの持ち点表示
    fill(255);
    for (int i = 0; i < allPlayer; i++) text(playerScores.get(i), width*(i*2+1)/(allPlayer*2), 300);
  }
}
