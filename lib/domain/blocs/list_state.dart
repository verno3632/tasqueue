import 'package:equatable/equatable.dart';
import 'package:tasqueue/domain/model/task.dart';

abstract class ListState extends Equatable {
  const ListState();

  @override
  List<Object> get props => [];
}

class ListInitial extends ListState {}

class ListFailure extends ListState {}

class ListSuccess extends ListState {
  final List<Task> tasks;

  const ListSuccess({this.tasks});

  ListSuccess copyWith({List<Task> tasks}) {
    return ListSuccess(tasks: tasks ?? this.tasks);
  }

  @override
  List<Object> get props => [tasks];

  @override
  String toString() => 'ListSuccess { tasks: ${tasks.length} }';
}
