import 'package:flutter/material.dart';
import 'package:tick_tac_toe/game_page.dart';
import 'package:tick_tac_toe/home_page.dart';
import 'package:tick_tac_toe/routes.dart';
import 'package:tick_tac_toe/winner_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.gameRoute: (context) => const GamePage(),
        MyRoutes.winnerRoute: (context) => const WinnerPage(winner: '', player1: '', player2: '',),
      },
    );
  }
}

