import 'package:flutter/material.dart';

class Fruit {
  const Fruit({
    required this.diameter,
    required this.score,
    required this.imageProvider,
  });
  final int diameter;
  final int score;
  final ImageProvider imageProvider;
}
