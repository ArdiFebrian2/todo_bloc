import 'package:flutter/material.dart';
import 'package:todo_bloc/models/todo.dart';

void showTodoDialog({
  required BuildContext context,
  Todo? existingTodo,
  required void Function(String, String) onSubmit,
}) {
  final edtTitle = TextEditingController(text: existingTodo?.title ?? '');
  final edtDescription = TextEditingController(
    text: existingTodo?.description ?? '',
  );

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(existingTodo == null ? 'Add New Todo' : 'Update Todo'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: edtTitle,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: edtDescription,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              final title = edtTitle.text.trim();
              final description = edtDescription.text.trim();
              if (title.isNotEmpty && description.isNotEmpty) {
                onSubmit(title, description);
                Navigator.of(context).pop();
              } else {
                // Optional: Show error if needed
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please fill all fields')),
                );
              }
            },
            child: Text(existingTodo == null ? 'Add' : 'Update'),
          ),
        ],
      );
    },
  );
}
