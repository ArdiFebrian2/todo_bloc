part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {
  const TodoEvent();
}

final class OnAddTodo extends TodoEvent {
  final Todo newTodo;
  const OnAddTodo(this.newTodo);
}

final class OnUpdateTodo extends TodoEvent {
  final int index;
  final Todo newTodo;
  const OnUpdateTodo({required this.index, required this.newTodo});
}

final class OnRemoveTodo extends TodoEvent {
  final int index;
  const OnRemoveTodo(this.index);
}
