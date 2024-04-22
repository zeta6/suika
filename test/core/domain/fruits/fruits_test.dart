import 'package:flutter_test/flutter_test.dart';
import 'package:suika/core/domain/fruits/fruits.dart';
import 'package:suika/gen/assets.gen.dart';

void main() {
  group('Fruits', () {
    test('should create Suika instance with correct values', () {
      final suika = Suika();

      expect(suika.diameter, equals(32));
      expect(suika.score, equals(16));
      expect(
          suika.imageProvider, equals(Assets.images.fruits.suika.provider()));
    });

    test('should create Pumpkin instance with correct values', () {
      final pumpkin = Pumpkin();

      expect(pumpkin.diameter, equals(24));
      expect(pumpkin.score, equals(12));
      expect(pumpkin.imageProvider,
          equals(Assets.images.fruits.pumpkin.provider()));
    });

    test('should create Strawberry instance with correct values', () {
      final strawberry = Strawberry();

      expect(strawberry.diameter, equals(8));
      expect(strawberry.score, equals(4));
      expect(strawberry.imageProvider,
          equals(Assets.images.fruits.strawberry.provider()));
    });
  });
}
