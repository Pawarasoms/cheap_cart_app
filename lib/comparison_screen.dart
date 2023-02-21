import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_list/base_card.dart';
import 'package:shopping_list/compare_item.dart';
import 'package:shopping_list/item_model.dart';
import 'constants.dart';
import 'package:provider/provider.dart';


class ComparisonScreen extends StatefulWidget {

  final List<int> item;

  ComparisonScreen({Key? key, required this.item}) : super(key: key);

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


  List item =[
    [1,false],
    [2,false],
  ];


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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20, right: 20,bottom: 20),
                    child: Row(
                      children: [
                        FloatingActionButton.extended(
                          label: const Text(
                            'Reset',
                            style: TextStyle(
                              color: redText,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          backgroundColor: kLigthRed,
                          icon: const Icon(
                            Icons.refresh,
                            size: 22.0,
                            color: redText,
                          ),
                          onPressed: () {
                            reset();

                            setState(() {
                              myItem1 = <int>[];
                              myItem2 = <int>[];
                              myItem3 = <int>[];
                              myItem4 = <int>[];
                              Provider.of<ItemModel>(context, listen: false).updateMyItem1(myItem1);
                              Provider.of<ItemModel>(context, listen: false).updateMyItem2(myItem2);
                              Provider.of<ItemModel>(context, listen: false).updateMyItem3(myItem3);
                              Provider.of<ItemModel>(context, listen: false).updateMyItem4(myItem4);
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
                          },
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        FloatingActionButton.extended(
                          label: const Text(
                            'Add Item',
                            style: TextStyle(
                              color: kDarkBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          backgroundColor: kLigthBlue,
                          icon: const Icon(
                            Icons.add_circle_outline,
                            size: 22.0,
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
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 30),
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return CompareItem(
                    itemNum: item[index][0],
                    addCart: item[index][1],
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                // height: 10,
                width: double.infinity,
                alignment: Alignment.center,
                // color: headAndTailBG,
                child: BaseCard(
                  theColor: kLightGreen,
                  theChild: Container(
                    width: 200.0,
                    height: 60.0,
                    child: const Center(
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: kDarkGreen,
                        ),
                      ),
                    ),
                  ),
                  theOnTapFunc: (){
                    print("item 1 : ${myItem1}");
                    print("item 2 : ${myItem2}");
                    print("item 3 : ${myItem3}");
                    print("item 4 : ${myItem4}");
                    print(item.length);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}











