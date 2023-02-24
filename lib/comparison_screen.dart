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
  int _selectedIndex = 0;

  List item = [
    [1, false],
    [2, false],
  ];

  void addItem() {
    setState(() {
      if (itemNum + 1 < 5) {
        item.add([itemNum + 1, false]);
        itemNum = itemNum + 1;
        print(itemNum);
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "same value!",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
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

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showTwoResult(
      String first, String second) {
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
                      "${first} and ${second} are cheapest",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 2,),
                    Text(
                      "They have same value!",
                      style: TextStyle(
                        fontSize: 18,
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

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showThreeResult(
      String first, String second, String third) {
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
                      "${first} and ${second} and ${third}",
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

                    double perDiff = 0.0;
                    switch (item.length) {
                      case 2:
                        {
                          if (myItem1.isNotEmpty && myItem2.isNotEmpty) {
                            double item1 = pricePerUnit(myItem1);
                            double item2 = pricePerUnit(myItem2);

                            if (item1 == item2) {
                              showAllResult();
                              cheapest.add(1);
                              cheapest.add(2);
                              break;
                            } else {
                              Map<double, String> itemMap = {
                                item1: "Item 1",
                                item2: "Item 2",
                              };
                              List<double> prices = itemMap.keys.toList();
                              prices.sort();
                              double cheapestPrice = prices[0];
                              double runnerUpPrice = prices[1];
                              String? cheapestItem = itemMap[cheapestPrice];
                              String? runnerUpItem = itemMap[runnerUpPrice];

                              perDiff = double.parse(
                                  (((runnerUpPrice - cheapestPrice) /
                                              runnerUpPrice) *
                                          100)
                                      .toStringAsFixed(1));

                              if (cheapestItem != null) {
                                String lastChar =
                                    cheapestItem[cheapestItem.length - 1];
                                cheapest.add(int.parse(lastChar));
                              }
                              showCheapestResult(cheapestItem!, runnerUpItem!, perDiff);
                            }
                          } else {
                            break;
                          }
                        }
                        break;
                      case 3:
                        {
                          if (myItem1.isNotEmpty &&
                              myItem2.isNotEmpty &&
                              myItem3.isNotEmpty) {
                            double item1 = pricePerUnit(myItem1);
                            double item2 = pricePerUnit(myItem2);
                            double item3 = pricePerUnit(myItem3);

                            if (item1 == item2 && item2 == item3) {
                              showAllResult();
                              cheapest.add(1);
                              cheapest.add(2);
                              cheapest.add(3);
                              break;
                            } else if ((item1 == item2) && (item1 < item3)) {
                              showTwoResult("Item 1", "Item 2");
                              cheapest.add(1);
                              cheapest.add(2);
                              break;
                            } else if ((item1 == item3) && (item1 < item2)) {
                              showTwoResult("Item 1", "Item 3");
                              cheapest.add(1);
                              cheapest.add(3);
                              break;
                            } else if ((item2 == item3) && (item2 < item1)) {
                              showTwoResult("Item 2", "Item 3");
                              cheapest.add(2);
                              cheapest.add(3);
                              break;
                            } else {
                              Map<double, String> itemMap = {
                                item1: "Item 1",
                                item2: "Item 2",
                                item3: "Item 3",
                              };
                              List<double> prices = itemMap.keys.toList();
                              prices.sort();
                              double cheapestPrice = prices[0];
                              double runnerUpPrice = prices[1];
                              String? cheapestItem = itemMap[cheapestPrice];
                              String? runnerUpItem = itemMap[runnerUpPrice];

                              perDiff = double.parse(
                                  (((runnerUpPrice - cheapestPrice) /
                                              runnerUpPrice) *
                                          100)
                                      .toStringAsFixed(1));

                              if (cheapestItem != null) {
                                String lastChar =
                                    cheapestItem[cheapestItem.length - 1];
                                cheapest.add(int.parse(lastChar));
                              }
                              showCheapestResult(cheapestItem!, runnerUpItem!, perDiff);
                            }
                          } else {
                            break;
                          }
                        }
                        break;
                      case 4:
                        {
                          if (myItem1.isNotEmpty &&
                              myItem2.isNotEmpty &&
                              myItem3.isNotEmpty &&
                              myItem4.isNotEmpty) {
                            double item1 = pricePerUnit(myItem1);
                            double item2 = pricePerUnit(myItem2);
                            double item3 = pricePerUnit(myItem3);
                            double item4 = pricePerUnit(myItem4);

                            if (item1 == item2 &&
                                item2 == item3 &&
                                item3 == item4) {
                              showAllResult();
                              cheapest.add(1);
                              cheapest.add(2);
                              cheapest.add(3);
                              cheapest.add(4);
                              break;
                            } else if ((item1 == item2) &&
                                (item1 < item3) &&
                                (item1 < item4)) {
                              showTwoResult("Item 1", "Item 2");
                              cheapest.add(1);
                              cheapest.add(2);
                              break;
                            } else if ((item1 == item3) &&
                                (item1 < item2) &&
                                (item1 < item4)) {
                              showTwoResult("Item 1", "Item 3");
                              cheapest.add(1);
                              cheapest.add(3);
                              break;
                            } else if ((item1 == item4) &&
                                (item1 < item2) &&
                                (item1 < item3)) {
                              showTwoResult("Item 1", "Item 4");
                              cheapest.add(1);
                              cheapest.add(4);
                              break;
                            } else if ((item2 == item3) &&
                                (item2 < item1) &&
                                (item2 < item4)) {
                              showTwoResult("Item 2", "Item 3");
                              cheapest.add(2);
                              cheapest.add(3);
                              break;
                            } else if ((item2 == item4) &&
                                (item2 < item1) &&
                                (item2 < item3)) {
                              showTwoResult("Item 2", "Item 4");
                              cheapest.add(2);
                              cheapest.add(4);
                              break;
                            } else if ((item3 == item4) &&
                                (item3 < item1) &&
                                (item3 < item2)) {
                              showTwoResult("Item 3", "Item 4");
                              cheapest.add(3);
                              cheapest.add(4);
                              break;
                            } else if (((item1 == item2) && (item1 == item3)) &&
                                (item1 < item4)) {
                              showThreeResult("Item 1", "Item 2" , "Item 3");
                              cheapest.add(1);
                              cheapest.add(2);
                              cheapest.add(3);
                              break;
                            } else if (((item1 == item2) && (item1 == item4)) &&
                                (item1 < item3)) {
                              showThreeResult("Item 1", "Item 2" , "Item 4");
                              cheapest.add(1);
                              cheapest.add(2);
                              cheapest.add(4);
                              break;
                            } else if (((item1 == item3) && (item1 == item4)) &&
                                (item1 < item2)) {
                              showThreeResult("Item 1", "Item 3" , "Item 4");
                              cheapest.add(1);
                              cheapest.add(3);
                              cheapest.add(4);
                              break;
                            } else if (((item2 == item3) && (item2 == item4)) &&
                                (item2 < item1)) {
                              showThreeResult("Item 2", "Item 3" , "Item 4");
                              cheapest.add(2);
                              cheapest.add(3);
                              cheapest.add(4);
                              break;
                            } else {
                              Map<double, String> itemMap = {
                                item1: "Item 1",
                                item2: "Item 2",
                                item3: "Item 3",
                                item4: "Item 4",
                              };
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
