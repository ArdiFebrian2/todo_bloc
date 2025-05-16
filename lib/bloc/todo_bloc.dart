import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc/models/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoInitial(todos: [])) {
    // Add Todo
    on<OnAddTodo>((event, emit) async {
      emit(TodoLoading(todos: state.todos));
      await Future.delayed(const Duration(milliseconds: 200));
      final newTodos = [...state.todos, event.newTodo];
      emit(TodoAdded(todos: newTodos));
    });

    on<OnUpdateTodo>((event, emit) async {
      emit(TodoLoading(todos: state.todos));
      await Future.delayed(const Duration(milliseconds: 200));
      final updatedTodos = [...state.todos];
      updatedTodos[event.index] = event.newTodo;
      emit(TodoUpdate(todos: updatedTodos));
    });

    on<OnRemoveTodo>((event, emit) async {
      emit(TodoLoading(todos: state.todos));
      await Future.delayed(const Duration(milliseconds: 200));
      final updatedTodos = [...state.todos]..removeAt(event.index);
      emit(TodoRemove(todos: updatedTodos));
    });
  }
}
