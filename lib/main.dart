import 'package:flutter/material.dart';
import 'package:shopping_list/comparison_screen.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/item_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ItemModel(),
      child: Consumer<ItemModel>(
        builder: (context, itemModel, child) {
          return MultiProvider(
            providers: [ChangeNotifierProvider<ItemModel>(create: (context) => ItemModel())],
            child: MaterialApp(home: ComparisonScreen(item: [],)),
          );

        },
      ),
    );
  }
}
