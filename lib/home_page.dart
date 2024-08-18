import 'package:flutter/material.dart';
import 'package:tick_tac_toe/players.dart';
import 'package:tick_tac_toe/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _player1FieldController = TextEditingController();
  final TextEditingController _player2FieldController = TextEditingController();

  var players = Players();

  @override
  void dispose() {
    _player1FieldController.dispose();
    _player2FieldController.dispose();
    super.dispose();
  }

  bool validateFields() {
    final player1 = _player1FieldController.text;
    final player2 = _player2FieldController.text;

    if (player1.isEmpty || player2.isEmpty) {
      return false; // Validation failed
    }

    return true; // Validation successful
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff191a4c),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Text(
                    'Enter Player names',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: _player1FieldController,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    decoration: const InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 45,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff100e30),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff100e30),
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xff100e30),
                      hintText: 'Player 1',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: _player2FieldController,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    decoration: const InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 45,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff100e30),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff100e30),
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xff100e30),
                      hintText: 'Player 2',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 55,
                  child: FractionallySizedBox(
                    widthFactor: 0.65,
                    child: ElevatedButton(
                      onPressed: () {
                        if (validateFields()) {
                          players.player1 = _player1FieldController.text;
                          players.player2 = _player2FieldController.text;

                          Navigator.pushReplacementNamed(context, MyRoutes.gameRoute, arguments: players);
                        }

                        else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Validation Error'),
                              content: const Text('Please enter both player names.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
