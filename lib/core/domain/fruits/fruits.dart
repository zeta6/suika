import 'package:suika/core/domain/fruits/fruit.dart';
import 'package:suika/gen/assets.gen.dart';

class Suika extends Fruit {
  Suika()
      : super(
          diameter: 32,
          score: 16,
          imageProvider: Assets.images.fruits.suika.provider(),
        );
}

class Pumpkin extends Fruit {
  Pumpkin()
      : super(
          diameter: 24,
          score: 12,
          imageProvider: Assets.images.fruits.suika.provider(),
        );
}

class Strawberry extends Fruit {
  Strawberry()
      : super(
          diameter: 8,
          score: 4,
          imageProvider: Assets.images.fruits.suika.provider(),
        );
}
