import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'base_card.dart';
import 'item_model.dart';

class CompareItem extends StatefulWidget {

  CompareItem({
    required this.itemNum, required this.isCheapest
  });

  final int itemNum;
  final bool isCheapest;

  @override
  CompareItemState createState() => CompareItemState();


}
class CompareItemState extends State<CompareItem> {

  List<int> item = List<int>.filled(3, 0);

  @override
  Widget build(BuildContext context) {
    List<int> myItem1 = Provider.of<ItemModel>(context).item1;
    List<int> myItem2 = Provider.of<ItemModel>(context).item2;
    List<int> myItem3 = Provider.of<ItemModel>(context).item3;
    List<int> myItem4 = Provider.of<ItemModel>(context).item4;

    List<TextEditingController> sizeController = Provider.of<ItemModel>(context).sizeController;
    List<TextEditingController> qtyController = Provider.of<ItemModel>(context).qtyController;
    List<TextEditingController> priceController = Provider.of<ItemModel>(context).priceController;

    return Container(

      child: Column(children: [
        Container(
          padding: EdgeInsets.only(left: 30, right: 20,top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Item "+ widget.itemNum.toString(),
                style: TextStyle(fontSize: 20, color: kLightGrey),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: BaseCard(
            theColor:widget.isCheapest ? kLigthPink : backgroundButton,

            theChild: Container(
              width: 600.0,
              height: 150.0,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 10, top: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: BaseCard(
                            theColor: kDarkGrey,
                            theChild: Container(
                              width: 80.0,
                              height: 40.0,
                              child: const Center(
                                child: Text(
                                  "Size",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: kWhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: BaseCard(
                            theColor: kDarkGrey,
                            theChild: Container(
                              width: 80.0,
                              height: 40.0,
                              child: const Center(
                                child: Text(
                                  "Qty",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: kWhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: BaseCard(
                            theColor: kDarkGrey,
                            theChild: Container(
                              width: 80.0,
                              height: 40.0,
                              child: const Center(
                                child: Text(
                                  "Price",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: kWhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(

                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Container(
                          child: BaseCard(
                            theColor: kLightGreen,
                            theChild: Container(
                              width: 100.0,
                              height: 80.0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                child: TextField(
                                  controller: sizeController[widget.itemNum-1],
                                  onChanged: (value) {
                                    item[0] = int.tryParse(value) ?? 0;
                                    if (widget.itemNum == 1 ){
                                      Provider.of<ItemModel>(context, listen: false).updateMyItem1(item);
                                    }else if (widget.itemNum == 2 ){
                                      Provider.of<ItemModel>(context, listen: false).updateMyItem2(item);
                                    }else if (widget.itemNum == 3 ){
                                      Provider.of<ItemModel>(context, listen: false).updateMyItem3(item);
                                    }else{
                                      Provider.of<ItemModel>(context, listen: false).updateMyItem4(item);
                                    }
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(width: 2, color: kWhite),
                                    ),
                                    filled: true,
                                    fillColor: kWhite,
                                  ),
                                  style: const TextStyle(
                                    color: kDarkGreen,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(4),
                                  ], // Only numbers can be entered
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: BaseCard(
                            theColor: kLightGreen,
                            theChild: Container(
                              width: 100.0,
                              height: 80.0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                child: TextField(
                                  controller: qtyController[widget.itemNum-1],
                                  onChanged: (value) {
                                    item[1] = int.tryParse(value) ?? 0;
                                    if (widget.itemNum == 1 ){
                                      Provider.of<ItemModel>(context, listen: false).updateMyItem1(item);
                                    }else if (widget.itemNum == 2 ){
                                      Provider.of<ItemModel>(context, listen: false).updateMyItem2(item);
                                    }else if (widget.itemNum == 3 ){
                                      Provider.of<ItemModel>(context, listen: false).updateMyItem3(item);
                                    }else{
                                      Provider.of<ItemModel>(context, listen: false).updateMyItem4(item);
                                    }
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(width: 2, color: kWhite),
                                    ),
                                    filled: true,
                                    fillColor: kWhite,
                                  ),
                                  style: const TextStyle(
                                    color: kDarkGreen,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                  ], // Only numbers can be entered
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: BaseCard(
                            theColor: kLightGreen,
                            theChild: Container(
                              width: 100.0,
                              height: 80.0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                child: TextField(
                                  controller: priceController[widget.itemNum-1],
                                  onChanged: (value) {
                                    item[2] = int.tryParse(value) ?? 0;
                                    if (widget.itemNum == 1 ){
                                      Provider.of<ItemModel>(context, listen: false).updateMyItem1(item);
                                    }else if (widget.itemNum == 2 ){
                                      Provider.of<ItemModel>(context, listen: false).updateMyItem2(item);
                                    }else if (widget.itemNum == 3 ){
                                      Provider.of<ItemModel>(context, listen: false).updateMyItem3(item);
                                    }else{
                                      Provider.of<ItemModel>(context, listen: false).updateMyItem4(item);
                                    }
                                  },
                                  textInputAction: TextInputAction.done,
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(width: 2, color: kWhite),
                                    ),
                                    filled: true,
                                    fillColor: kWhite,
                                  ),
                                  style: const TextStyle(
                                    color: kDarkGreen,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                  ], // Only numbers can be entered
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            theOnTapFunc: () {
              print('pressed');
            },
          ),
        ),
      ]),
    );
  }
}

