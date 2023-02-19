import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_list/compare_item.dart';
import 'package:shopping_list/dialog_popup.dart';
import 'constants.dart';
import 'shopping_list.dart';

class ComparisonScreen extends StatefulWidget {
  const ComparisonScreen({Key? key}) : super(key: key);

  @override
  State<ComparisonScreen> createState() => _ComparisonScreenState();
}

class _ComparisonScreenState extends State<ComparisonScreen> {

  int itemNum = 2;
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

  List item =[
    [1,false],
    [2,false],
  ];


  void checkBoxChanged(bool? value, int index){
    setState(() {
      item[index][1] =!item[index][1];
    });
    showDialog(context: context, builder: (context){
      return DialogPopUp();
    },);
  }

  void addItem(){
    setState(() {
     if( itemNum+1 < 5){
       item.add([itemNum+1,false]);
       itemNum = itemNum+1;
     }
    });
  }

  void reset(){
    setState(() {
      item[0][1] =false;
      item[1][1] =false;
      while(itemNum > 2){
        item.removeAt(itemNum-1);
        itemNum= itemNum-1;
      }
    });
  }

  TextEditingController _controller = TextEditingController();

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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, right: 20, bottom: 20),
                child: Row(
                  children: [
                    FloatingActionButton.extended(
                      label: const Text(
                        'Reset',
                        style: TextStyle(
                          color: redText,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      backgroundColor: kLigthRed,
                      icon: const Icon(
                        Icons.refresh,
                        size: 24.0,
                        color: redText,
                      ),
                      onPressed: () {
                        print("Reset");
                        _controller.clear();
                        reset();
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton.extended(
                      label: const Text(
                        'Add Item',
                        style: TextStyle(
                          color: kDarkBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      backgroundColor: kLigthBlue,
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 24.0,
                        color: kDarkBlue,
                      ),
                      onPressed: () {
                        addItem();
                        print("Add Item");

                      },
                    ),
                  ],
                ),
              )
            ],

          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 30),
              itemCount: item.length,
              itemBuilder: (context, index) {
                return CompareItem(
                  itemNum: item[index][0],
                  addCart: item[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                );
              },
            ),
          ),

        ],
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
        selectedIconTheme:
        const IconThemeData(color: kDarkGreen, size: 28),
        onTap: _onItemTapped,
      ),
    );
  }






}




