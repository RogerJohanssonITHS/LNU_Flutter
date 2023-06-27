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

class ToDoList extends StatefulWidget {
  const ToDoList({super.key, required this.title});

  final String title;

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final List<Todo> _myTodos = <Todo>[];
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _addTodo(String task) {
    setState(() {
      _myTodos.add(Todo(task: task, done: false));
    });
    _textEditingController.clear();
  }

  // void _handleTodoChange(Todo todo) {
  //   setState(() {
  //     todo.done = !todo.done;
  //   });
  // }

  void _deleteTodo(Todo todo) {
    setState(() {
      _myTodos.removeWhere((element) => element.task == todo.task);
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
            children: _myTodos.map((Todo todo) {
              return TodoItem(
                todo: todo,
                //onTodoChanged: _handleTodoChange,
                removeTodo: _deleteTodo,
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
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a ToDo'),
          content: TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(hintText: 'Add ToDo here'),
            autofocus: true,
          ),
          actions: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
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
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _addTodo(_textEditingController.text);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class Todo {
  Todo({required this.task, required this.done});
  String task;
  bool done;
}

class TodoItem extends StatelessWidget {
  TodoItem(
      {required this.todo,
      //required this.onTodoChanged,
      required this.removeTodo})
      : super(key: ObjectKey(todo));

  final Todo todo;
  //final void Function(Todo todo) onTodoChanged;
  final void Function(Todo todo) removeTodo;

  // TextStyle? _getTextStyle(bool checked) {
  //   if (!checked) return null;

  //   return const TextStyle(
  //     color: Colors.black54,
  //     decoration: TextDecoration.lineThrough,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        removeTodo(todo);
      },
      // leading: Checkbox(
      //   checkColor: Colors.greenAccent,
      //   activeColor: Colors.red,
      //   value: todo.done,
      //   onChanged: (value) {
      //     onTodoChanged(todo);
      //   },
      // ),
      title: Row(children: <Widget>[
        Tooltip(
          message: 'Click row or trash can to delete ToDo!',
          child: Text(
            todo.task,
          ),
        ),
        IconButton(
          iconSize: 30,
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
          alignment: Alignment.centerLeft,
          onPressed: () {
            removeTodo(todo);
          },
        ),
      ]),
    );
  }
}
