part of 'todo_bloc.dart';

@immutable
sealed class TodoState {
  final List<Todo> todos;

  const TodoState({required this.todos});
}

final class TodoInitial extends TodoState {
  const TodoInitial({required super.todos});
}

final class TodoAdded extends TodoState {
  const TodoAdded({required super.todos});
}

final class TodoRemove extends TodoState {
  const TodoRemove({required super.todos});
}

final class TodoUpdate extends TodoState {
  const TodoUpdate({required super.todos});
}

final class TodoLoading extends TodoState {
  const TodoLoading({required super.todos});
}
