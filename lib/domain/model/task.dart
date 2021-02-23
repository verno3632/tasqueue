import 'package:equatable/equatable.dart';

class Task extends Equatable {
  String title;

  Task(this.title);

  Task.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  @override
  List<Object> get props => [title];
}

class EmptyTask extends Task {
  EmptyTask() : super("");
}
