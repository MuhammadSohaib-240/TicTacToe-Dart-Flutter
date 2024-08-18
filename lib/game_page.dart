import 'package:flutter/material.dart';
import 'package:tick_tac_toe/players.dart';
import 'package:tick_tac_toe/winner_page.dart';

import 'game_logic.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Players players;
  TicTacToeGame ticTacToeGame = TicTacToeGame();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    players = ModalRoute.of(context)!.settings.arguments as Players;
  }

  void handleGameOver(String winner) {
    String result;
    if (winner == players.player1 || winner == players.player2) {
      result = winner;
    } else {
      result = 'Tie';
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WinnerPage(
          winner: result,
          player1: players.player1,
          player2: players.player2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff191a4c),
        body: SafeArea(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              color: const Color(0xff100e30),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                players.player1,
                                style: const TextStyle(
                                    color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Icon(
                                Icons.cancel,
                                color: Colors.red,
                                size: 50,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: const Color(0xff100e30),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                players.player2,
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 50,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xff6446c4),
                      borderRadius: BorderRadius.circular(20)),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 7,
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            ticTacToeGame.makeMove(index);
                            if (ticTacToeGame.checkWin('X')) {
                              handleGameOver(players.player1);
                              return;
                            }
                            if (ticTacToeGame.checkWin('O')) {
                              handleGameOver(players.player2);
                              return;
                            }
                            if (ticTacToeGame.board.every((cell) => cell != '')) {
                              handleGameOver('Tie');
                              return;
                            }
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: const Color(0xff100e30),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: ticTacToeGame.board[index] == 'X'
                                ? const Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 65,
                            )
                                : (ticTacToeGame.board[index] == 'O'
                                ? const Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 65,
                            )
                                : null),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
