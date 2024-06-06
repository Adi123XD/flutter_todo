import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/dialog_box.dart';
import 'package:todoapp/util/todo_tile.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  // reference the Hive box
  final _mybox = Hive.box('mybox');
  // database instance
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the first time even opening the app , create default data
    if (_mybox.get("TODOLIST")==null)
    {
      db.createInitialData();
    }
    else{
      // else load the data
      db.loadData();
    }
    super.initState();
  }
  // a controller for dialog box textfield
  final _controller = TextEditingController();

  void checkboxChanged(bool? value , int index)
  {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  // Save a new task 
  void saveNewTask(){
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }
  void createNewTask (){
    showDialog(
      context: context, 
      builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: ()=>{Navigator.of(context).pop(),},
      );
    });
  }
  // void delete task 
  void deleteTask (int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
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
        itemCount: db.todoList.length,
        itemBuilder: (context,index){
          return TodoTile(
            taskName: db.todoList[index][0], 
            isCompleted: db.todoList[index][1], 
            onChanged: (value)=>checkboxChanged(value ,index),
            deleteFunction:(context)=>deleteTask(index),
          );
        }),
        );
  }}