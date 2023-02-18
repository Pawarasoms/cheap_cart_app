import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';
import 'base_card.dart';

class CompareItem extends StatelessWidget {
  const CompareItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(left: 30, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Item 1",
                style: TextStyle(fontSize: 20, color: kLightGrey),
              ),
              Container(
                child: Row(
                  children: const [
                    Text(
                      "Add to cart",
                      style: TextStyle(fontSize: 20, color: kDarkGreen),
                    ),
                    MyStatefulWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: BaseCard(
            theColor: backgroundButton,
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
                                padding: EdgeInsets.symmetric(
                                    horizontal:8, vertical: 8),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(width: 2,color: kWhite)

                                    ),
                                    filled: true,
                                    fillColor: kWhite,
                                  ),
                                  style: const TextStyle(
                                      color: kDarkGreen,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
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
                                padding: EdgeInsets.symmetric(
                                    horizontal:8, vertical: 8),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(width: 2,color: kWhite)

                                    ),
                                    filled: true,
                                    fillColor: kWhite,
                                  ),
                                  style: const TextStyle(
                                      color: kDarkGreen,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
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
                                padding: EdgeInsets.symmetric(
                                    horizontal:8, vertical: 8),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(width: 2,color: kWhite)

                                    ),
                                    filled: true,
                                    fillColor: kWhite,
                                  ),
                                  style: const TextStyle(
                                      color: kDarkGreen,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
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

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return kDarkGreen;
      }
      return kDarkGreen;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
