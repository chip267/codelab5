import 'package:codelab5/models/todo.dart';
import 'package:codelab5/screens/new_item.dart';
import 'package:codelab5/widgets/todos_list.dart';
import 'package:flutter/material.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() {
    return _TodosState();
  }
}

class _TodosState extends State<Todos> {
  final List<Todo> _todos = [];

  void _addItem() async {
    final result = await Navigator.of(context).push<Todo>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (result == null) {
      return;
    }

    setState(() {
      _todos.add(result);
    });
  }

  void _deleteItem(Todo todoItem) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: const Text(
          'Do you want to delete this item?',
          style: TextStyle(
            fontFamily: 'CeraPro',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _todos.remove(todoItem);
              });
              Navigator.pop(ctx);
            },
            child: const Text(
              'Yes',
              style: TextStyle(
                fontFamily: 'CeraPro',
                color: Color.fromARGB(255, 9, 139, 246),
                fontSize: 18,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text(
              'No',
              style: TextStyle(
                fontFamily: 'CeraPro',
                color: Color.fromARGB(255, 9, 139, 246),
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      padding: const EdgeInsets.only(top: 48),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No todos added yet.',
              style: TextStyle(
                fontFamily: 'CeraPro',
              ),
            ),
          ],
        ),
      ),
    );

    if (_todos.isNotEmpty) {
      content = TodosList(
        todos: _todos,
        onDelete: _deleteItem,
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Todos',
          style: TextStyle(
            fontFamily: 'CeraPro',
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: content,
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          onPressed: _addItem,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
    );
  }
}
