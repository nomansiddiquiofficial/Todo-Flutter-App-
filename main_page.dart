import "package:flutter/material.dart";
//import "package:todo_app/util/button.dart";
import "package:todo_app/util/dialog_box.dart";
import "package:todo_app/util/todo_tile.dart";
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late SharedPreferences sp;

  List<dynamic> todoList = [
    ["Do something!", false],
  ];

  @override
  void initState() {
    super.initState();
    initializePrefs();
  }

  void initializePrefs() async {
    sp = await SharedPreferences.getInstance();
    loadData();
  }

  void loadData() {
    List<String>? prefTodoList = sp.getStringList("prefTodoList");
    if (prefTodoList != null) {
      setState(() {
        todoList = [];
        for (String item in prefTodoList) {
          todoList.add([item, false]);
        }
      });
    }
  }

  void saveData() {
    List<String> savedList = [];
    for (List<dynamic> item in todoList) {
      savedList.add(item[0]);
    }
    sp.setStringList("prefTodoList", savedList);
  }

  void changedTextBox(value, index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
      saveData();
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) => DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () {
              _controller.clear();
              Navigator.of(context).pop();
            }));
  }

  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      saveData();
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
      saveData();
    });
  }

  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1b263b),
      appBar: AppBar(
        title: const Text("Todo App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: createNewTask,
        backgroundColor: Color(0xFF415a77),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskText: todoList[index][0],
            complete: todoList[index][1],
            onChanged: (value) => changedTextBox(value, index),
            deleteButton: () => deleteTask(index),
          );
        },
      ),
    );
  }
}
