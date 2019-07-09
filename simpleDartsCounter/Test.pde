void testGame501() {
  
  for (int gp = 1; gp <= 4; gp++) {
    println("----------------------------------------");
    
    // 変数初期化のテスト
    GameClass g = new Game501(gp);
    assert g.topBarHeight == 50 : "Error";
    assert g.gameName.equals("501") : "Error";
    assert g.inputScore.length == 3 : "Error";
    for (String s: g.inputScore) assert s.isEmpty() : "Error";
    assert g.nowIndex == 0 : "Error";
    assert g.nowPlayer == 0 : "Error";
    assert g.allPlayer == gp : "Error";
    assert g.winner == 0 : "Error";
    assert g.isPlaying == true : "Error";
    assert g.isUpdated == false : "Error";
    assert g.isError == false : "Error";
    assert g.playerScores.length == gp : "Error";
    for (int i: g.playerScores) assert i == 501 : "Error";
    println("[Game501] Passed!: Initialize");
    
    // スコア変換のテスト
    assert g.convertToIntScore(new String[] {"0", "", ""}) == 0 : "Error";
    assert g.convertToIntScore(new String[] {"1", "", ""}) == 1 : "Error";
    assert g.convertToIntScore(new String[] {"1", "8", ""}) == 18 : "Error";
    assert g.convertToIntScore(new String[] {"1", "8", "0"}) == 180 : "Error";
    assert g.convertToIntScore(new String[] {"9", "9", "9"}) == 999 : "Error";
    println("[Game501] Passed!: convertToIntScore(String[]) -> int");
    
    // スコア反映のテスト
    g.inputScore = new String[] {"0", "", ""};
    assert g.isScoreUpdated() == true : "Error";
    g.inputScore = new String[] {"1", "8", "0"};
    assert g.isScoreUpdated() == true : "Error";
    g.inputScore = new String[] {"1", "8", "1"};
    assert g.isScoreUpdated() == false : "Error";
    println("[Game501] Passed!: updateScore() -> boolean");
    
    // 数字入力のテスト
    g.addInput(String.valueOf('1'));
    assert Arrays.equals(g.inputScore, new String[] {"1", "", ""}) : "Error";
    g.addInput(String.valueOf('8'));
    assert Arrays.equals(g.inputScore, new String[] {"1", "8", ""}) : "Error";
    g.addInput(String.valueOf('0'));
    assert Arrays.equals(g.inputScore, new String[] {"1", "8", "0"}) : "Error";
    g.addInput(String.valueOf('9'));
    assert Arrays.equals(g.inputScore, new String[] {"1", "8", "0"}) : "Error";
    
    // エラー修正時のテスト
    g.inputScore = new String[] {"1", "8", "1"};
    g.isScoreUpdated();
    assert g.isError == true : "Error";
    
    // Bust判定関数のテスト
    g = new Game501(gp);
    while (g.playerScores[g.nowPlayer] != 141) {
      g.inputScore = new String[] {"1", "8", "0"};
      g.isScoreUpdated();
      g.changePlayer();
    }
    assert g.isBust(142) == true : "Error";
    assert g.isBust(141) == false : "Error";
    
    // ゲームの終了条件を満たしているか
    assert g.isFinish() == true : "Error";
    println("[Game501] Passed!: isFinish() -> boolean");
    
    println("[Game501] Passed!: Case " + gp + " Player(s)");;
  }
  
}

void testSelectClass() {
  
}
