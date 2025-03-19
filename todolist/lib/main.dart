import 'package:flutter/material.dart';
import 'package:todolist/modals/items.dart';
import 'package:todolist/widget/card_body_widget.dart';
import 'package:todolist/widget/card_modal_bottom.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<DataItems> items = [];

  void _handleAddTask(String name) {
    final newTask = DataItems(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(newTask);
    });
    // print(newTask);
  }

  void _handleDelete(String id) {
    // print(id);
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "ToDoList",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children:
              items
                  .map(
                    (item) => CardBody(
                      index: items.indexOf(item),
                      item: item,
                      handleDelete: _handleDelete,
                    ),
                  )
                  .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
        onPressed: () {
          showModalBottomSheet<void>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return ModalBottom(addTask: _handleAddTask);
            },
          );
        },
        child: Icon(Icons.add, color: Colors.white, weight: 20, size: 50),
      ),
    );
  }
}
