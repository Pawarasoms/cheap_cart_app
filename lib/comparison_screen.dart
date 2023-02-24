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
  List<int> cheapest = <int>[];

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

  List item = [
    [1, false],
    [2, false],
  ];

  void addItem() {
    setState(() {
      if (itemNum + 1 < 5) {
        item.add([itemNum + 1, false]);
        itemNum = itemNum + 1;
      }
    });
  }

  void reset() {
    setState(() {
      item[0][1] = false;
      item[1][1] = false;
      while (itemNum > 2) {
        item.removeAt(itemNum - 1);
        itemNum = itemNum - 1;
      }
    });
  }

  double pricePerUnit(List<int> item) {
    var result = item[2] / (item[0] * item[1]);
    return double.parse(result.toStringAsFixed(2));
  }

  void findCheapest(Map<double, String> itemMap){

    cheapest = <int>[];
    double perDiff = 0.0;
    List<double> prices = itemMap.keys.toList();
    prices.sort();
    double cheapestPrice = prices[0];
    double runnerUpPrice = prices[1];
    String? cheapestItem = itemMap[cheapestPrice];
    String? runnerUpItem = itemMap[runnerUpPrice];

    if (cheapestItem != null) {
      String lastChar =
      cheapestItem[cheapestItem.length - 1];
      cheapest.add(int.parse(lastChar));
    }
    perDiff = double.parse(
        (((runnerUpPrice - cheapestPrice) /
            runnerUpPrice) *
            100)
            .toStringAsFixed(1));
    showCheapestResult(cheapestItem!, runnerUpItem!, perDiff);

  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showCheapestResult(
      String cheapest, String runnerUp, double value) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Container(
        padding: EdgeInsets.all(16),
        height: 90,
        decoration: BoxDecoration(
          color: kDarkGreen,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Row(
            children: [
              // const SizedBox(width: 48,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    // "${cheapestItem} is cheapest and is ${perDiff}% cheaper than ${runnerUpItem}"
                    Text("${cheapest} is cheapest", style: TextStyle(fontSize: 28, color: Colors.white,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 2,),

                    Text("It is ${value}% cheaper than ${runnerUp}", style: TextStyle(fontSize: 20, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showAllResult() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: EdgeInsets.all(16),
          height: 98,
          decoration: BoxDecoration(
            color: kDarkGreen,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "All items have the",
                        style: TextStyle(
                          fontSize: 28,
                          color: headAndTailBG,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "same value!",
                        style: TextStyle(
                          fontSize: 28,
                          color:headAndTailBG,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showTwoOrMoreResult(List<String> cheapestItems) {
    if (cheapestItems.length == 2){
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
          padding: EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            color: kDarkGreen,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${cheapestItems[0]} and ${cheapestItems[1]}",
                        style: TextStyle(
                          fontSize: 28,
                          color: headAndTailBG,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 2,),
                      Text(
                        "are cheapest",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));

    }else{
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
          padding: EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            color: kDarkGreen,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${cheapestItems[0]} and ${cheapestItems[1]} and ${cheapestItems[2]}",
                        style: TextStyle(
                          fontSize: 23,
                          color: headAndTailBG,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 2,),
                      Text(
                        "are cheapest",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));
    }

  }


  @override
  Widget build(BuildContext context) {

    List<int> myItem1 = Provider.of<ItemModel>(context).item1;
    List<int> myItem2 = Provider.of<ItemModel>(context).item2;
    List<int> myItem3 = Provider.of<ItemModel>(context).item3;
    List<int> myItem4 = Provider.of<ItemModel>(context).item4;

    List<TextEditingController> sizeController =
        Provider.of<ItemModel>(context).sizeController;
    List<TextEditingController> qtyController =
        Provider.of<ItemModel>(context).qtyController;
    List<TextEditingController> priceController =
        Provider.of<ItemModel>(context).priceController;

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20, right: 20, bottom: 20),
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
                              Provider.of<ItemModel>(context, listen: false)
                                  .updateMyItem1(<int>[]);
                              Provider.of<ItemModel>(context, listen: false)
                                  .updateMyItem2(<int>[]);
                              Provider.of<ItemModel>(context, listen: false)
                                  .updateMyItem3(<int>[]);
                              Provider.of<ItemModel>(context, listen: false)
                                  .updateMyItem4(<int>[]);
                              cheapest = <int>[];
                            });

                            for(int i=0 ; i<4;i++){
                              sizeController[i].clear();
                              qtyController[i].clear();
                              priceController[i].clear();
                            }
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
                            for (int i = 0; i < itemNum; i++) {
                              item[i][1] = false;
                            }
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
                    isCheapest: item[index][1],
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
                  theOnTapFunc: () {

                    print("item 1 : ${myItem1}");
                    print("item 2 : ${myItem2}");
                    print("item 3 : ${myItem3}");
                    print("item 4 : ${myItem4}");

                    setState(() {
                      cheapest = <int>[];
                      for (int i = 0; i < itemNum; i++) {
                        item[i][1] = false;
                      }
                    });


                    switch (item.length) {
                      case 2:
                        {
                          if (myItem1.isNotEmpty && myItem2.isNotEmpty)  {

                            List<double> prices = [pricePerUnit(myItem1), pricePerUnit(myItem2)];

                            double minPrice = prices.reduce((a, b) => a < b ? a : b);

                            for (int i = 1; i <= prices.length; i++) {
                              if (prices[i-1] == minPrice) {
                                cheapest.add(i);
                              }
                            }

                            if (cheapest.length == 2 ){
                              showAllResult();
                            }else{
                              Map<double, String> itemMap = {
                                prices[0]: "Item 1",
                                prices[1]: "Item 2",

                              };
                              findCheapest(itemMap);
                            }
                          }else {
                            break;
                          }
                        }
                        break;
                      case 3:
                        {
                          if (myItem1.isNotEmpty &&
                              myItem2.isNotEmpty &&
                              myItem3.isNotEmpty) {

                            List<String> items = ['Item 1', 'Item 2', 'Item 3'];

                            List<double> prices = [pricePerUnit(myItem1), pricePerUnit(myItem2), pricePerUnit(myItem3)];

                            double minPrice = prices.reduce((a, b) => a < b ? a : b);

                            for (int i = 1; i <= prices.length; i++) {
                              if (prices[i-1] == minPrice) {
                                cheapest.add(i);
                              }
                            }

                            if (cheapest.length == 3 ){
                              showAllResult();
                            }else if( cheapest.length == 2 ){
                              showTwoOrMoreResult(cheapest.map((i) => items[i-1]).toList());
                            }else{
                              Map<double, String> itemMap = {
                                prices[0]: "Item 1",
                                prices[1]: "Item 2",
                                prices[2]: "Item 3",
                              };
                              findCheapest(itemMap);
                            }
                          }
                        }
                        break;
                      case 4:
                        {
                          if (myItem1.isNotEmpty &&
                              myItem2.isNotEmpty &&
                              myItem3.isNotEmpty &&
                              myItem4.isNotEmpty) {

                            List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

                            List<double> prices = [pricePerUnit(myItem1), pricePerUnit(myItem2), pricePerUnit(myItem3), pricePerUnit(myItem4)];

                            double minPrice = prices.reduce((a, b) => a < b ? a : b);

                            for (int i = 1; i <= prices.length; i++) {
                              if (prices[i-1] == minPrice) {
                                cheapest.add(i);
                              }
                            }

                            if (cheapest.length == 4 ){
                              showAllResult();
                            }else if( cheapest.length == 3 || cheapest.length ==2){
                              showTwoOrMoreResult(cheapest.map((i) => items[i-1]).toList());
                              
                            }else{
                              Map<double, String> itemMap = {
                                prices[0]: "Item 1",
                                prices[1]: "Item 2",
                                prices[2]: "Item 3",
                                prices[3]: "Item 4",
                              };
                              findCheapest(itemMap);
                            }
                          } else {
                            break;
                          }
                        }
                        break;
                    }
                    setState(() {
                      for (int i = 0; i < cheapest.length; i++) {
                        item[cheapest[i] - 1][1] = true;
                      }
                    });
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
