import 'package:flutter/material.dart';
import 'package:shopping_list/comparison_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ComparisonScreen(),
    );
  }
}
