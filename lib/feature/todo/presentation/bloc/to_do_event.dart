part of 'to_do_bloc.dart';

sealed class ToDoEvent extends Equatable {
  const ToDoEvent();
}

class AddToDoEvent extends ToDoEvent {
  final String task;
  const AddToDoEvent({required this.task});
  @override
  List<Object> get props => [task];
}

class RemoveToDoEvent extends ToDoEvent {
  final Object task;
 const RemoveToDoEvent({required this.task});
  @override
  List<Object> get props => [task];
}
