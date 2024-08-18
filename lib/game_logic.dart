class TicTacToeGame {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';

  bool checkWin(String player) {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == player &&
          board[i + 1] == player &&
          board[i + 2] == player) {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[i] == player &&
          board[i + 3] == player &&
          board[i + 6] == player) {
        return true;
      }
    }

    // Check diagonals
    if ((board[0] == player && board[4] == player && board[8] == player) ||
        (board[2] == player && board[4] == player && board[6] == player)) {
      return true;
    }

    return false;
  }

  void makeMove(int index) {
    if (board[index] == '') {
      board[index] = currentPlayer;
      if (checkWin(currentPlayer)) {
        // Handle game over logic here
        return;
      }
      if (board.every((cell) => cell != '')) {
        // Handle tie logic here
        return;
      }
      currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
    }
  }

  void resetGame() {
    board = List.filled(9, '');
    currentPlayer = 'X';
  }
}