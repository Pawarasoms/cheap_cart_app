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
        MaterialPageRoute(builder: (context) => ComparisonScreen()),
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
      body: Container(

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
        // onTap: (index) {
        //   switch (index) {
        //     case 0:
        //       Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(builder: (context) => ComparisonScreen()),
        //       );
        //       print("0000000");
        //       break;
        //     case 1:
        //       _onItemTapped(index);
        //       // Navigator.pushReplacement(
        //       //   context,
        //       //   MaterialPageRoute(builder: (context) => ShoppingListScreen()),
        //       // );
        //       print("111111111");
        //       break;
        //   }
        // },
        onTap: _onItemTapped,
      ),
    );
  }
}


