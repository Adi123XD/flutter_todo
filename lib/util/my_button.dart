import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final String buttonName ;
  VoidCallback onPressed;
  MyButton({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Color.fromARGB(255, 247, 238, 217),
      onPressed: onPressed,
      child: Text(buttonName),
    );
  }
}
