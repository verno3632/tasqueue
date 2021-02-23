import 'package:equatable/equatable.dart';
import 'package:tasqueue/domain/model/task.dart';

abstract class AddState extends Equatable {
  const AddState();

  @override
  List<Object> get props => [];
}

class Initial extends AddState {}

class TaskFetched extends AddState {
  final Task task;

  const TaskFetched(this.task);

  @override
  List<Object> get props => [task];

  @override
  String toString() => 'TaskFetched { tasks: $task }';
}
