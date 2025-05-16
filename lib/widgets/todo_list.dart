// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:todo_bloc/models/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(int, Todo) onEdit;
  final Function(int) onDelete;

  const TodoList({
    super.key,
    required this.todos,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          leading: CircleAvatar(child: Text("${index + 1}")),
          title: Text(todo.title),
          subtitle: Text(todo.description),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () => onEdit(index, todo),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => onDelete(index),
              ),
            ],
          ),
          onTap: () => onEdit(index, todo),
        );
      },
    );
  }
}
