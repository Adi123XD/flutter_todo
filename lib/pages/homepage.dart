import 'package:flutter/material.dart';
import 'package:todoapp/util/dialog_box.dart';
import 'package:todoapp/util/todo_tile.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  // a controller for dialog box textfield
  final _controller = TextEditingController();
  // todo list 
  List todoList =[
    ["Make Tutorial", false],
    ["Exercise", false],
    ["Learn Flutter", false],
  ];

  void checkboxChanged(bool? value , int index)
  {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void createNewTask (){
    showDialog(
      context: context, 
      builder: (context){
      return DialogBox();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text("TO DO",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.yellow,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellow,
        child: Icon(Icons.add,size: 30.0,) ,
        ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context,index){
          return TodoTile(
            taskName: todoList[index][0], 
            isCompleted: todoList[index][1], 
            onChanged: (value)=>checkboxChanged(value ,index)
          );
        }),
        );
  }}