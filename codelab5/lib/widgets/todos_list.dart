import 'package:codelab5/models/todo.dart';
import 'package:codelab5/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';

class TodosList extends StatelessWidget {
  const TodosList({
    super.key,
    required this.todos,
    required this.onDelete,
  });

  final List<Todo> todos;
  final void Function(Todo item) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 12,
        ),
        child: SwipeActionCell(
          key: ValueKey(todos[index].id),
          trailingActions: [
            SwipeAction(
              title: "Archive",
              onTap: (CompletionHandler handler) async {},
              color: Colors.green,
              icon: const Icon(
                Icons.archive_rounded,
                color: Colors.white,
              ),
            ),
            SwipeAction(
              title: "Delete",
              onTap: (CompletionHandler handler) async {
                onDelete(todos[index]);
              },
              color: Colors.red,
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ],
          child: TodoItem(
            todo: todos[index],
          ),
        ),
      ),
    );
  }
}
