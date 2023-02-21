
import 'package:flutter/cupertino.dart';

class ItemModel extends ChangeNotifier{

  List<int> _item1=<int>[];
  List<int> _item2=<int>[];
  List<int> _item3=<int>[];
  List<int> _item4=<int>[];


  List<int> get item1 => _item1;
  List<int> get item2 => _item2;
  List<int> get item3 => _item3;
  List<int> get item4 => _item4;


  set item1(List<int> item1) {
    _item1 = item1;
  }
  set item2(List<int> item2) {
    _item2 = item2;
  }
  set item3(List<int> item3) {
    _item3 = item3;
  }
  set item4(List<int> item4) {
    _item4 = item4;
  }


  void updateMyItem1(List<int> newItem1) {
    _item1 = newItem1;
    notifyListeners();
  }
  void updateMyItem2(List<int> newItem2) {
    _item2 = newItem2;
    notifyListeners();
  }
  void updateMyItem3(List<int> newItem3) {
    _item3 = newItem3;
    notifyListeners();
  }
  void updateMyItem4(List<int> newItem4) {
    _item4 = newItem4;
    notifyListeners();
  }


  List<TextEditingController> sizeController = [
    for (int i = 0; i < 4; i++)
      TextEditingController()
  ];
  List<TextEditingController> qtyController = [
    for (int i = 0; i < 4; i++)
      TextEditingController()
  ];
  List<TextEditingController> priceController = [
    for (int i = 0; i < 4; i++)
      TextEditingController()
  ];

}