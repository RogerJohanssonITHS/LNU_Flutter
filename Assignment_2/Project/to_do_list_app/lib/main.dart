import 'package:flutter/material.dart';

void main() {
  runApp(const ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  const ToDoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoListApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ToDoList(title: 'Here is your ToDo list'),
    );
  }
}

class ToDo {
  ToDo({required this.task});
  String task;
}

class ToDoList extends StatefulWidget {
  const ToDoList({super.key, required this.title});

  final String title;

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final List<ToDo> _myToDos = <ToDo>[];
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _addToDo(String task) {
    setState(() {
      _myToDos.add(ToDo(task: task));
    });
    _textEditingController.clear();
  }

  void _deleteToDo(ToDo toDo) {
    setState(() {
      _myToDos.removeWhere((element) => element.task == toDo.task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Scrollbar(
          thumbVisibility: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            children: _myToDos.map((ToDo toDo) {
              return ToDoItem(
                toDo: toDo,
                removeToDo: _deleteToDo,
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(),
        tooltip: 'Add a ToDo',
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.green.withOpacity(0.3),
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(hintText: 'Type ToDo here'),
            autofocus: true,
          ),
          actions: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _addToDo(_textEditingController.text);
              },
              child: const Text('Add Item'),
            ),
          ],
        );
      },
    );
  }
}

class ToDoItem extends StatelessWidget {
  ToDoItem({required this.toDo, required this.removeToDo})
      : super(key: ObjectKey(toDo));

  final ToDo toDo;
  final void Function(ToDo toDo) removeToDo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        removeToDo(toDo);
      },
      title: Row(children: <Widget>[
        Tooltip(
          message: 'Click row or trash can to delete ToDo!',
          child: Text(
            toDo.task,
          ),
        ),
        IconButton(
          iconSize: 24,
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
          alignment: Alignment.centerLeft,
          onPressed: () {
            removeToDo(toDo);
          },
        ),
      ]),
    );
  }
}
