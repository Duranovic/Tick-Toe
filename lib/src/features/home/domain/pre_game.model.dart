import 'package:tick_toe_flutter/src/features/home/domain/pre_game.enums.dart';

class PreGameSettings {
  late GameMode mode;
  late GameDifficulty difficulty;
  late GameStep gameStep;

  PreGameSettings(this.mode, this.difficulty, this.gameStep);
}
