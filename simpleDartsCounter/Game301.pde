class Game301 extends GameClass {
  
  ArrayList<Button> buttons;
  
  Game301(int player) {
    super(player, 10, 301, 50, "301");
    buttons = new ArrayList<Button>();
  }
  
  boolean isFinish() {
    return playerScores[nowPlayer] == 0 || nowRound == allRound;
  }
  
  int judgeWinner() {
    int win = 0;
    for (int i = 1; i < playerScores.length; i++) {
      if (playerScores[i] < playerScores[winner]) win = i;
    }
    return win;
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
