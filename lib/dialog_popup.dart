import 'package:flutter/material.dart';
import 'package:shopping_list/constants.dart';

class DialogPopUp extends StatelessWidget {
  const DialogPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      backgroundColor: headAndTailBG,
      content: Container(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Add an item to the cart?",style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: kDarkGreen
              ),),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Do something when Cancel button is pressed
                    Navigator.pop(context);
                  },
                  child: Text("Cancel",style: TextStyle(
                      fontSize: 20,
                    color: redText
                  ),),
                  style: ElevatedButton.styleFrom(
                    primary: kLigthRed, //
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    // set the background color of the button
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Do something when Confirm button is pressed
                    Navigator.pop(context);
                  },
                  child: Text("Confirm",style: TextStyle(
                    fontSize: 20,
                    color: kDarkBlue
                  ),),
                  style: ElevatedButton.styleFrom(
                    primary: kLigthBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    // set the background color of the button
                  ),
                ),
              ],
            )

          ],
        )
      ),
    );
  }
}
