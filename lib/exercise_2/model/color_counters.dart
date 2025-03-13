import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/exercise_2/model/card_type.dart';

class ColorCounters with ChangeNotifier {
  final Map<CardType, int> _tapCounts = {
    for (var type in CardType.values) type: 0,
  };

  int getTapCount(CardType type) => _tapCounts[type]!;

  void incrementTap(CardType type) {
    _tapCounts[type] = _tapCounts[type]! + 1;
    notifyListeners();
  }
}
