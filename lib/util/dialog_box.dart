import 'package:flutter/material.dart';
import 'package:todoapp/util/my_button.dart';
class DialogBox extends StatelessWidget {
//  final  controller;
  const DialogBox({super.key });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              // controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: "Add a new task..."),
            ),

            // buttons save and cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(buttonName: "Save", onPressed: (){}),
                const SizedBox(width: 8,),
                MyButton(buttonName: "Cancel", onPressed: (){}),
              ],
            )

          ],
        ),
        
      ),
    );
  }
}