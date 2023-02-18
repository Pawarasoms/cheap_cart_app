import 'package:flutter/material.dart';
import 'package:shopping_list/compare_item.dart';
import 'constants.dart';
import 'shopping_list.dart';

class ComparisonScreen extends StatefulWidget {
  const ComparisonScreen({Key? key}) : super(key: key);

  @override
  State<ComparisonScreen> createState() => _ComparisonScreenState();
}

class _ComparisonScreenState extends State<ComparisonScreen> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ShoppingListScreen()),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comparison',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: headAndTailBG,
        foregroundColor: kDarkGreen,
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
            CompareItem(),
            CompareItem(),

            Container(),
            Container(),
            Container(),
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
        selectedItemColor: kDarkGreen,
        backgroundColor: headAndTailBG,
        unselectedFontSize: 15,
        selectedFontSize: 20,
        selectedIconTheme: const IconThemeData(color: kDarkGreen, size: 28),
        onTap: _onItemTapped,
      ),
    );
  }
}


