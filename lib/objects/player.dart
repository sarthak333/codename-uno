import 'package:bonfire/bonfire.dart';

class PlayerSpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "player/ship.png",
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(64, 64),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "player/ship.png",
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(64, 64),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleRight: idleRight,
        runRight: runRight,
      );
}

class Knight extends SimplePlayer with ObjectCollision {
  Knight(Vector2 position)
      : super(
          position: position,
          size: Vector2(64, 64),
          animation: PlayerSpriteSheet.simpleDirectionAnimation,
          speed: 1000,
        ) {
    setupCollision(
      CollisionConfig(
        enable: true,
        collisions: [
          //required
          CollisionArea.rectangle(
            size: Vector2(64, 64),
            align: Vector2(0, 0),
          ),
        ],
      ),
    );
  }
}
