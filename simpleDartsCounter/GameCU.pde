class GameCU extends GameClass {
  
  ArrayList<Button> buttons;
  
  GameCU(int player) {
    super(player, 0, 50, "COUNT-UP");
    buttons = new ArrayList<Button>();
  }
  
  boolean isFinish() {
    return playerScores[nowPlayer] == 800;  // 本来は最終プレイヤーの8ラウンドが終了した時点
  }
  
  int judgeWinner() {
    return max(playerScores);
  }
  
  boolean isScoreUpdated() {
    setError(inputScore[0].isEmpty() || 181 <= convertToIntScore(inputScore));
    if (isError) return false;
    playerScores[nowPlayer] += convertToIntScore(inputScore);
    return true;
  }
  
  void draw() {
    super.draw();
    for (Button b: buttons) b.draw();
  }
  
}
