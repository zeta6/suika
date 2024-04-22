import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:suika/core/widgets/layout/layout.dart';
import 'package:suika/features/game/presentation/game_main.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return SafeAreaLayout(
      isBackButtonVisible: true,
      child: GameWidget(
        game: GameMain(),
      ),
    );
  }
}
