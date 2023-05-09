import 'package:flutter/cupertino.dart';
import 'package:tick_toe_flutter/src/features/game/domain/game.enum.dart';

class WinsNotifier extends ValueNotifier {
  WinsNotifier(var value) : super(value);

  showWinner(Player player, currentResult) {
    value.latestWinner = player;
  }
}

final winsNotifier = WinsNotifier({});
