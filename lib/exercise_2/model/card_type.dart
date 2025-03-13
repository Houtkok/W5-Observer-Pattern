import 'package:flutter/material.dart';

enum CardType { red, blue, green, yellow }

Map<CardType, Color> cardColors = {
  CardType.blue: Colors.blue,
  CardType.red: Colors.red,
  CardType.green: Colors.green,
  CardType.yellow: Colors.yellow,
};