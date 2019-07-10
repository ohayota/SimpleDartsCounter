void testGame01() {
  final int[] games = new int[] {301, 501};
  
  for (int game = 0; game < games.length; game++) {
    final int score = games[game];
    
    for (int gp = 1; gp <= 4; gp++) {
      println("----------------------------------------");
      
      // 変数初期化のテスト(Constructor(int))
      GameClass g;
      if (score == 301) {
        g = new Game301(gp);
      } else {
        g = new Game501(gp);
      }
      
      assert g.topBarHeight == 50 : "Error";
      assert g.gameName.equals(String.valueOf(score)) : "Error";
      assert g.playerScores.length == gp : "Error";
      for (int i: g.playerScores) assert i == score : "Error";
      assert g.inputScore.length == 3 : "Error";
      for (String s: g.inputScore) assert s.isEmpty() : "Error";
      assert g.nowIndex == 0 : "Error";
      assert g.nowPlayer == 0 : "Error";
      assert g.allPlayer == gp : "Error";
      assert g.winner == 0 : "Error";
      if (score == 301) {
        assert g.allRound == 10 : "Error";
      } else {
        assert g.allRound == 15 : "Error";
      }
      assert g.nowRound == 1 : "Error";
      assert g.isPlaying == true : "Error";
      assert g.isUpdated == false : "Error";
      assert g.isError == false : "Error";
      println("[Game" + score + "] Passed!: Constructor");
      
      // スコア変換のテスト(convertToIntScore(String[]) -> int)
      assert g.convertToIntScore(new String[] {"0", "", ""}) == 0 : "Error";
      assert g.convertToIntScore(new String[] {"1", "", ""}) == 1 : "Error";
      assert g.convertToIntScore(new String[] {"1", "8", ""}) == 18 : "Error";
      assert g.convertToIntScore(new String[] {"1", "8", "0"}) == 180 : "Error";
      assert g.convertToIntScore(new String[] {"1", "8", "1"}) == 181 : "Error";
      assert g.convertToIntScore(new String[] {"9", "9", "9"}) == 999 : "Error";
      println("[Game" + score + "] Passed!: convertToIntScore(String[]) -> int");
      
      // Bust判定関数のテスト(isBust(int) -> boolean)
      g.playerScores[0] = 150;
      assert g.isBust(151) == true : "Error";
      assert g.isBust(150) == false : "Error";
      println("[Game" + score + "] Passed!: isBust(int) -> boolean");
      
      // スコア反映のテスト(updateScore() -> boolean)
      g.playerScores[g.nowPlayer] = 150;
      g.deleteInput();
      g.inputScore = new String[] {"", "", ""};
      assert g.isScoreUpdated() == false : "Error";
      g.deleteInput();
      g.inputScore = new String[] {"1", "8", "1"};
      assert g.isScoreUpdated() == false : "Error";
      g.deleteInput();
      g.inputScore = new String[] {"1", "0", "0"};
      assert g.isScoreUpdated() == true : "Error";
      println("[Game" + score + "] Passed!: isScoreUpdated() -> boolean");
      
      // プレイヤー交代時に呼ぶ(changePlayer() -> void)
      int np = g.nowPlayer;
      if (g.allPlayer == 1 || np+1 == g.allPlayer) {
        g.changePlayer();
        assert g.nowPlayer == 0 : "Error";
      } else {
        g.changePlayer();
        assert np == g.nowPlayer-1 : "Error";
      }
      println("[Game" + score + "] Passed!: changePlayer() -> void");
      
      // 終了条件のテスト(isFinish() -> boolean)
      g.playerScores[g.nowPlayer] = 0;
      assert g.isFinish() == true : "Error";
      println("[Game" + score + "] Passed!: isFinish() -> boolean");
      
      // ゲームに勝ったプレイヤーの判定(judgeWinner() -> int)
      assert g.judgeWinner() == g.nowPlayer : "Error";
      println("[Game" + score + "] Passed!: judgeWinner() -> int");
      
      // ゲームに終了時の処理(terminateGame() -> void)
      g.terminateGame();
      assert g.isPlaying == false : "Error";
      println("[Game" + score + "] Passed!: terminateGame() -> void");
      
      // 数字入力(addInput(String) -> void)
      g.inputScore = new String[] {"", "", ""};
      g.addInput(String.valueOf('1'));
      assert Arrays.equals(g.inputScore, new String[] {"1", "", ""}) : "Error";
      g.addInput(String.valueOf('8'));
      assert Arrays.equals(g.inputScore, new String[] {"1", "8", ""}) : "Error";
      g.addInput(String.valueOf('0'));
      assert Arrays.equals(g.inputScore, new String[] {"1", "8", "0"}) : "Error";
      g.addInput(String.valueOf('9'));
      assert Arrays.equals(g.inputScore, new String[] {"1", "8", "0"}) : "Error";
      println("[Game" + score + "] Passed!: addInput(String) -> void");
      
      // 数字1文字消去(deleteInput() -> void)
      g.deleteInput();
      assert Arrays.equals(g.inputScore, new String[] {"1", "8", ""}) : "Error";
      g.deleteInput();
      assert Arrays.equals(g.inputScore, new String[] {"1", "", ""}) : "Error";
      g.deleteInput();
      assert Arrays.equals(g.inputScore, new String[] {"", "", ""}) : "Error";
      g.deleteInput();
      assert Arrays.equals(g.inputScore, new String[] {"", "", ""}) : "Error";
      println("[Game" + score + "] Passed!: deleteInput() -> void");
      
      // 数字1文字消去(resetInput() -> void)
      g.inputScore = new String[] {"1", "8", "0"};
      g.resetInput();
      assert Arrays.equals(g.inputScore, new String[] {"", "", ""}) : "Error";
      println("[Game" + score + "] Passed!: resetInput() -> void");
      
      // エラー修正時のテスト
      g.inputScore = new String[] {"1", "8", "1"};
      g.isScoreUpdated();
      assert g.isError == true : "Error";
      
      println("[Game" + score + "] Passed!: Case " + gp + " player(s)");;
    }
  }
}

void testGameCU() {
  
  for (int gp = 1; gp <= 4; gp++) {
    println("----------------------------------------");
    
    // 変数初期化のテスト(Constructor(int))
    GameClass g = new GameCU(gp);
    
    assert g.topBarHeight == 50 : "Error";
    assert g.gameName.equals("COUNT-UP") : "Error";
    assert g.playerScores.length == gp : "Error";
    for (int i: g.playerScores) assert i == 0 : "Error";
    assert g.inputScore.length == 3 : "Error";
    for (String s: g.inputScore) assert s.isEmpty() : "Error";
    assert g.nowIndex == 0 : "Error";
    assert g.nowPlayer == 0 : "Error";
    assert g.allPlayer == gp : "Error";
    assert g.winner == 0 : "Error";
    assert g.allRound == 8 : "Error";
    assert g.nowRound == 1 : "Error";
    assert g.isPlaying == true : "Error";
    assert g.isUpdated == false : "Error";
    assert g.isError == false : "Error";
    println("[GameCU] Passed!: Constructor");
    
    // スコア変換のテスト(convertToIntScore(String[]) -> int)
    assert g.convertToIntScore(new String[] {"0", "", ""}) == 0 : "Error";
    assert g.convertToIntScore(new String[] {"1", "", ""}) == 1 : "Error";
    assert g.convertToIntScore(new String[] {"1", "8", ""}) == 18 : "Error";
    assert g.convertToIntScore(new String[] {"1", "8", "0"}) == 180 : "Error";
    assert g.convertToIntScore(new String[] {"1", "8", "1"}) == 181 : "Error";
    assert g.convertToIntScore(new String[] {"9", "9", "9"}) == 999 : "Error";
    println("[GameCU] Passed!: convertToIntScore(String[]) -> int");
    
    // スコア反映のテスト(updateScore() -> boolean)
    g.deleteInput();
    g.inputScore = new String[] {"", "", ""};
    assert g.isScoreUpdated() == false : "Error";
    g.deleteInput();
    g.inputScore = new String[] {"1", "8", "1"};
    assert g.isScoreUpdated() == false : "Error";
    g.deleteInput();
    g.inputScore = new String[] {"1", "0", "0"};
    assert g.isScoreUpdated() == true : "Error";
    println("[GameCU] Passed!: isScoreUpdated() -> boolean");
    
    // プレイヤー交代時に呼ぶ(changePlayer() -> void)
    int np = g.nowPlayer;
    if (g.allPlayer == 1 || np+1 == g.allPlayer) {
      g.changePlayer();
      assert g.nowPlayer == 0 : "Error";
    } else {
      g.changePlayer();
      assert np == g.nowPlayer-1 : "Error";
    }
    println("[GameCU] Passed!: changePlayer() -> void");
    
    // 終了条件のテスト(isFinish() -> boolean)
    g.nowRound = 8;
    g.nowPlayer = gp-1;
    assert g.isFinish() == true : "Error";
    println("[GameCU] Passed!: isFinish() -> boolean");
    
    // ゲームに勝ったプレイヤーの判定(judgeWinner() -> int)
    int maxScore = max(g.playerScores);
    assert g.playerScores[g.judgeWinner()] == maxScore : "Error";
    println("[GameCU] Passed!: judgeWinner() -> int");
    
    // ゲームに終了時の処理(terminateGame() -> void)
    g.terminateGame();
    assert g.isPlaying == false : "Error";
    println("[GameCU] Passed!: terminateGame() -> void");
    
    // 数字入力(addInput(String) -> void)
    g.inputScore = new String[] {"", "", ""};
    g.addInput(String.valueOf('1'));
    assert Arrays.equals(g.inputScore, new String[] {"1", "", ""}) : "Error";
    g.addInput(String.valueOf('8'));
    assert Arrays.equals(g.inputScore, new String[] {"1", "8", ""}) : "Error";
    g.addInput(String.valueOf('0'));
    assert Arrays.equals(g.inputScore, new String[] {"1", "8", "0"}) : "Error";
    g.addInput(String.valueOf('9'));
    assert Arrays.equals(g.inputScore, new String[] {"1", "8", "0"}) : "Error";
    println("[GameCU] Passed!: addInput(String) -> void");
    
    // 数字1文字消去(deleteInput() -> void)
    g.deleteInput();
    assert Arrays.equals(g.inputScore, new String[] {"1", "8", ""}) : "Error";
    g.deleteInput();
    assert Arrays.equals(g.inputScore, new String[] {"1", "", ""}) : "Error";
    g.deleteInput();
    assert Arrays.equals(g.inputScore, new String[] {"", "", ""}) : "Error";
    g.deleteInput();
    assert Arrays.equals(g.inputScore, new String[] {"", "", ""}) : "Error";
    println("[GameCU] Passed!: deleteInput() -> void");
    
    // 数字1文字消去(resetInput() -> void)
    g.inputScore = new String[] {"1", "8", "0"};
    g.resetInput();
    assert Arrays.equals(g.inputScore, new String[] {"", "", ""}) : "Error";
    println("[GameCU] Passed!: resetInput() -> void");
    
    // エラー修正時のテスト
    g.inputScore = new String[] {"1", "8", "1"};
    g.isScoreUpdated();
    assert g.isError == true : "Error";
    
    println("[GameCU] Passed!: Case " + gp + " player(s)");;
  }
  
}
