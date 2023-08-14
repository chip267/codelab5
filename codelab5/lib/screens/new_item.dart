import 'package:codelab5/models/todo.dart';
import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveItem() {
    Navigator.of(context).pop(
      Todo(
        id: DateTime.now().toString(),
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          'Create Todo',
          style: TextStyle(
            fontFamily: 'CeraPro',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey, //New
              blurRadius: 5.0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                label: Text(
                  'Todo',
                  style: TextStyle(
                    fontFamily: 'CeraPro',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 3,
              controller: _descriptionController,
              decoration: const InputDecoration(
                label: Text(
                  'Description',
                  style: TextStyle(
                    fontFamily: 'CeraPro',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.blue),
              child: TextButton(
                onPressed: _saveItem,
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontFamily: 'CeraPro',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
