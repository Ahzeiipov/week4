import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color_counters.dart';
import 'color_tap.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ColorCounters(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Home rebuilt");
    return Scaffold(
      appBar: AppBar(
        title: Text('Color increment'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ColorCounters>(
            builder: (context, counters, child) {
              return Column(
                children: [
                  ColorTap(
                    color: Colors.red,
                    isRed: true,
                  ),
                  Text("Red Tap : ${counters.redCount}"),
                  ColorTap(color: Colors.blue, isRed: false),
                  Text("Blue Tap : ${counters.blueCount}")
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
