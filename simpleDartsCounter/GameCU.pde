class GameCU extends GameClass {
  
  ArrayList<Button> buttons;
  
  GameCU(int player) {
    super(player, 8, 0, 50, "COUNT-UP");
    buttons = new ArrayList<Button>();
  }
  
  boolean isFinish() {
    return nowRound == allRound && nowPlayer+1 == allPlayer;
  }
  
  int judgeWinner() {
    int win = 0;
    for (int i = 1; i < playerScores.length; i++) {
      if (playerScores[winner] < playerScores[i]) win = i;
    }
    return win;
  }
  
  boolean isScoreUpdated() {
    setError(inputScore[0].isEmpty() || 181 <= convertToIntScore(inputScore));
    if (isError) return false;
    int roundScore = convertToIntScore(inputScore);
    playerScores[nowPlayer] += roundScore;
    return true;
  }
  
  void draw() {
    super.draw();
    textSize(40);
    for (Button b: buttons) b.draw();
  }
  
}
