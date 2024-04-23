import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

class ShotButton extends PositionComponent with TapCallbacks {
  ShotButton({
    required double radius,
    required Vector2 position,
  })  : _radius = radius,
        super(
          position: position,
          size: Vector2.all(2 * radius),
          // anchor: Anchor.bottomRight,
        ) {
    this.position = position;
  }

  final double _radius;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(
      Offset(_radius, _radius),
      _radius,
      Paint()..color = const Color(0xFF80C080),
    );
  }

  @override
  void onTapDown(TapDownEvent event) {
    GameMain.shot();
  }
}

class GameMain extends Forge2DGame with TapCallbacks {
  static bool shotting = false;
  static void shot() {
    print(shotting);
    shotting = true;
  }

  @override
  Color backgroundColor() {
    return Colors.lightBlueAccent;
  }

  void onUpdate() {
    if (shotting) {
      world.add(Ball());
      shotting = false;
    }
  }

  @override
  void update(double dt) {
    onUpdate();
    super.update(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    // TODO: implement onTapDown
    super.onTapDown(event);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    camera.viewport.add(FpsTextComponent());
    world.add(ShotButton(
      radius: 3,
      position: Vector2(10, 24),
    ));
    world.add(Ball());
    world.addAll(createBoundaries());
  }

  List<Component> createBoundaries() {
    final visibleRect = camera.visibleWorldRect;
    final left = visibleRect.left + 2;
    final right = visibleRect.right - 2;
    final top = visibleRect.top + 6;
    final bottom = visibleRect.bottom - 12;
    final topLeft = Vector2(left, top);
    final topRight = Vector2(right, top);
    final bottomLeft = Vector2(left, bottom);
    final bottomRight = Vector2(right, bottom);

    return [
      Wall(topLeft, topRight),
      Wall(topLeft, bottomLeft),
      Wall(topRight, bottomRight),
      Wall(bottomLeft, bottomRight),
      // Wall(
      //     Vector2(-10, -10),
      //     Vector2(
      //       10,
      //       -10,
      //     ))
      // Wall(topRight, bottomRight),
      // Wall(bottomLeft, bottomRight),
      // Wall(topLeft, bottomLeft),
    ];
  }
}

class Ball extends BodyComponent with TapCallbacks {
  Ball({Vector2? initialPosition})
      : super(
          fixtureDefs: [
            FixtureDef(
              CircleShape()..radius = 5,
              restitution: 0.8,
              friction: 0.4,
            ),
          ],
          bodyDef: BodyDef(
            angularDamping: 0.8,
            position: initialPosition ?? Vector2.zero(),
            type: BodyType.dynamic,
          ),
        );

  @override
  void onTapDown(_) {
    // body.applyLinearImpulse(Vector2.random() * 5000);
  }
}

class Wall extends BodyComponent {
  final Vector2 _start;
  final Vector2 _end;

  Wall(this._start, this._end);

  @override
  Body createBody() {
    final shape = EdgeShape()..set(_start, _end);
    final fixtureDef = FixtureDef(shape, friction: 0.3);
    final bodyDef = BodyDef(
      position: Vector2.zero(),
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
