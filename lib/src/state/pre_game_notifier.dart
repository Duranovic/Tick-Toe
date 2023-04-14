import 'package:flutter/cupertino.dart';
import 'package:tick_toe_flutter/src/features/home/domain/pre_game.enums.dart';
import 'package:tick_toe_flutter/src/features/home/domain/pre_game.model.dart';

class PreGameNotifier extends ValueNotifier<PreGameSettings> {
  PreGameNotifier(PreGameSettings value) : super(value);

  void setGameMode(GameMode mode) {
    value.mode = mode;
    notifyListeners();
  }

  void setDifficulty(GameDifficulty difficulty) {
    value.difficulty = difficulty;
    notifyListeners();
  }

  void setGameStep(GameStep gameStep) {
    value.gameStep = gameStep;
    notifyListeners();
  }
}

final preGameNotifier = PreGameNotifier(PreGameSettings(
    GameMode.singleplayer, GameDifficulty.easy, GameStep.selectGameMode));
