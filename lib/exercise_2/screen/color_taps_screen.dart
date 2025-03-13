import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_3_blabla_project/exercise_2/model/card_type.dart';
import 'package:week_3_blabla_project/exercise_2/screen/widgets/color_tap.dart';
import '../model/color_counters.dart';

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Taps')),
      body: Consumer<ColorCounters>(
        builder: (context, colorCounters, child) {
          return ListView(
            children: CardType.values.map((type) {
              return ColorTap(
                type: type,
                tapCount: colorCounters.getTapCount(type),
                onTap: () => colorCounters.incrementTap(type),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}