import 'package:flutter/material.dart';
import 'package:tick_tac_toe/players.dart';
import 'package:tick_tac_toe/routes.dart';

class WinnerPage extends StatefulWidget {
  final String winner;
  final String player1;
  final String player2;

  const WinnerPage({super.key, required this.winner, required this.player1, required this.player2});

  @override
  State<WinnerPage> createState() => _WinnerPageState();
}

class _WinnerPageState extends State<WinnerPage> {
  var players = Players();

  @override
  Widget build(BuildContext context) {
    players.player1 = widget.player1;
    players.player2 = widget.player2;

    return Scaffold(
      backgroundColor: const Color(0xff191a4c),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.winner == 'Tie' ? "It's a tie!" : 'Winner: ${widget.winner}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  height: 50,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);// Navigate back to the previous page
                    },
                    child: const Icon(Icons.rotate_left),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  height: 50,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, MyRoutes.gameRoute, arguments: players);// Navigate back to the previous page
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
