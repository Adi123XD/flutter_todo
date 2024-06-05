import 'package:flutter/material.dart';
class TodoTile extends StatelessWidget {
  final  String taskName ;
  final bool isCompleted ;
  Function (bool?)? onChanged ;
   TodoTile({super.key,
   required this.taskName,
   required this.isCompleted,
   required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0, right: 25.0, top: 25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12)),
        child: Row(
          
          children: [
            // checkbox
            Checkbox(value: isCompleted, onChanged: onChanged,
            activeColor: Colors.black,),
            
            // task name 
            Text(taskName,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
            decoration: isCompleted? TextDecoration.lineThrough : TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}