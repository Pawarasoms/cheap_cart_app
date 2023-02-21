import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_list/compare_item.dart';
import 'package:shopping_list/dialog_popup.dart';
import 'package:shopping_list/item_model.dart';
import 'constants.dart';
import 'shopping_list.dart';
import 'package:provider/provider.dart';


class ComparisonScreen extends StatefulWidget {

  final List<int> item;

  ComparisonScreen({super.key,required this.item});

  @override
  State<ComparisonScreen> createState() => _ComparisonScreenState();
}

class _ComparisonScreenState extends State<ComparisonScreen> {

  List<int> _item = <int>[];

  @override
  void initState() {
    _item = widget.item;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
    List<int> myItem1 = Provider.of<ItemModel>(context).item1;
    List<int> myItem2 = Provider.of<ItemModel>(context).item2;
    List<int> myItem3 = Provider.of<ItemModel>(context).item3;
    List<int> myItem4 = Provider.of<ItemModel>(context).item4;

    List<TextEditingController> sizeController = Provider.of<ItemModel>(context).sizeController;
    List<TextEditingController> qtyController = Provider.of<ItemModel>(context).qtyController;
    List<TextEditingController> priceController = Provider.of<ItemModel>(context).priceController;

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
                        print("before");
                        print(myItem1);
                        print(myItem2);
                        print(myItem3);
                        print(myItem4);
                        reset();

                        setState(() {
                          myItem1 = <int>[];
                          myItem2 = <int>[];
                          myItem3 = <int>[];
                          myItem4 = <int>[];
                        });

                        sizeController[0].clear();
                        qtyController[0].clear();
                        priceController[0].clear();

                        sizeController[1].clear();
                        qtyController[1].clear();
                        priceController[1].clear();

                        sizeController[2].clear();
                        qtyController[2].clear();
                        priceController[2].clear();

                        sizeController[3].clear();
                        qtyController[3].clear();
                        priceController[3].clear();

                        print("after");
                        print(myItem1);
                        print(myItem2);
                        print(myItem3);
                        print(myItem4);
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











