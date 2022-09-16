import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/widgets/enemy/necro_enemy.dart';
import 'package:pacman_game/widgets/heart/heart_sprite_sheet.dart';
import 'package:pacman_game/widgets/player/player.dart';

class Hearts extends GameDecoration with Sensor {
  Hearts({required Vector2 position})
      : super.withAnimation(
            animation: HeartSpriteSheet.heart,
            position: position,
            size: Vector2(8, 8)) {
    setupSensorArea(areaSensor: [
      CollisionArea.rectangle(
        size: Vector2(10, 10),
        align: Vector2(-3, -3),
      ),
    ]);
  }

  @override
  void onContact(GameComponent component) {
    if (component is GamePlayer) {
      gameRef.player?.addLife(20);
    } else if (component is NecroEnemy) {
      gameRef.player?.addLife(0);
    }
    removeFromParent();
  }

  @override
  void onContactExit(GameComponent component) {}
}
