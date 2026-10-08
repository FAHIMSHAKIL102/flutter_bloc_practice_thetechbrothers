import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final List<String> todoList = [];
  ToDoBloc() : super(ToDoState()) {
    on<AddToDoEvent>(addToDoEvent);
    on<RemoveToDoEvent>(removeToDoEvent);
  }

  FutureOr<void> addToDoEvent(AddToDoEvent event, Emitter<ToDoState> emit) {
    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  FutureOr<void> removeToDoEvent(
    RemoveToDoEvent event,
    Emitter<ToDoState> emit,
  ) {
    todoList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}
