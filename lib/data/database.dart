import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List todoList=[];
  final _mybox = Hive.box('mybox');

  // run this if it is the first time ever opening the app
  void createInitialData(){
    todoList=[
      ["Make Tutorial",false],
    ["Do Exercise",false]
    ];
  }
  void loadData(){
    todoList = _mybox.get("TODOLIST");
  }
  void updateData(){
    _mybox.put("TODOLIST", todoList);
  }

}