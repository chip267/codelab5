import 'package:codelab5/models/todo.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      if (isDone) {
        return const Color.fromARGB(255, 123, 208, 247);
      }

      return Colors.lightBlue;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 8,
        ),
        child: Row(
          children: [
            Checkbox(
              shape: const CircleBorder(),
              checkColor: Colors.white,
              activeColor: Colors.red,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isDone,
              onChanged: (check) {
                setState(() {
                  isDone = check!;
                });
              },
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.todo.title,
                  style: TextStyle(
                    fontFamily: 'CeraPro',
                    fontSize: 18,
                    decoration: isDone ? TextDecoration.lineThrough : null,
                    decorationColor: Colors.black26,
                    color: isDone ? Colors.black26 : Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.todo.description,
                  style: TextStyle(
                    fontFamily: 'CeraPro',
                    fontSize: 18,
                    decoration: isDone ? TextDecoration.lineThrough : null,
                    decorationColor: Colors.black26,
                    color: isDone ? Colors.black26 : Colors.black,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
