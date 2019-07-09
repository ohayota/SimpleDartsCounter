class Game301 extends GameClass {
  
  ArrayList<Button> buttons;
  
  Game301(int player) {
    super(player, 301, 50, "301");
    buttons = new ArrayList<Button>();
  }
  
  boolean isFinish() {
    return playerScores[nowPlayer] == 0;
  }
  
  int judgeWinner() {
    return min(playerScores);
  }
  
  boolean isScoreUpdated() {
    setError(inputScore[0].isEmpty() || 181 <= convertToIntScore(inputScore));
    if (isError) return false;
    // Bustしないときだけ点数更新
    int roundScore = convertToIntScore(inputScore);
    if (!isBust(roundScore)) playerScores[nowPlayer] -= roundScore;
    return true;
  }
  
  void draw() {
    super.draw();
    for (Button b: buttons) b.draw();
  }
  
}
