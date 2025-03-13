import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_3_blabla_project/exercise_2/model/card_type.dart';
import '../model/color_counters.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: Consumer<ColorCounters>(builder: (context, colorCounters, child) {
        return ListView(
          children: CardType.values.map((type) {
            return ListTile(
              title: Text('${type.name.toUpperCase()} Taps '),
              trailing: Text('${colorCounters.getTapCount(type)}',
                  style: const TextStyle(fontSize: 24)),
            );
          }).toList(),
        );
      }),
    );
  }
}
