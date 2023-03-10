import 'package:flutter/material.dart';
import 'constants.dart';
import 'comparison_screen.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ComparisonScreen(item: [],)),
      );
    } else {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kLigthPink,
        foregroundColor: kDarkPink,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30, right: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton.extended(
                    label: const Text(
                      'Reset',
                      style: TextStyle(color: redText, fontWeight: FontWeight.bold,fontSize: 18),
                    ),
                    backgroundColor: kLigthRed,
                    icon: const Icon(
                      Icons.refresh,
                      size: 24.0,
                      color: redText,
                    ),
                    onPressed: () {
                      print("Reset");
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton.extended(
                    label: const Text(
                      'Add Item',
                      style: TextStyle(color: kDarkGreen, fontWeight: FontWeight.bold,fontSize: 18),
                    ),
                    backgroundColor: kLigthBlue,
                    icon: const Icon(
                      Icons.add_circle_outline,
                      size: 24.0,
                      color: kDarkGreen,
                    ),
                    onPressed: () {
                      print("Add Item");
                    },
                  ),
                ],
              ),
            ),



          ],
        ),
      ),



      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.balance),
            label: 'Comparison',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shopping List',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kDarkPink,
        backgroundColor: kLigthPink,
        unselectedFontSize: 15,
        selectedFontSize: 20,
        selectedIconTheme: const IconThemeData(color: kDarkPink, size: 28),
        onTap: _onItemTapped,
      ),
    );
  }
}


