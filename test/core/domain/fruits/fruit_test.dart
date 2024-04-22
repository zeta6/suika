import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suika/core/domain/fruits/fruit.dart';
import 'package:suika/gen/assets.gen.dart';

void main() {
  group('Fruit', () {
    test('should create Fruit instance with correct values', () {
      const diameter = 10;
      const score = 5;
      ImageProvider imageProvider = Assets.images.fruits.suika.provider();

      Fruit fruit = Fruit(
        diameter: diameter,
        score: score,
        imageProvider: imageProvider,
      );

      expect(fruit.diameter, equals(diameter));
      expect(fruit.score, equals(score));
      expect(fruit.imageProvider, equals(imageProvider));
    });
  });
}
