import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color_counters.dart ';

class ColorTap extends StatelessWidget {
  final Color color;
  final bool isRed;

  const ColorTap({super.key, required this.color, required this.isRed});

  @override
  Widget build(BuildContext context) {
    print("ColorTap ($color) rebuilt");
    return GestureDetector(
      onTap: () {
        if (isRed) {
          context.read<ColorCounters>().incrementRed();
        } else {
          context.read<ColorCounters>().incrementBlue();
        }
      },
      child: Container(
        margin: EdgeInsets.all(20),
        width: 500,
        height: 100,
        color: color,
        
      ),
    );
  }
}
