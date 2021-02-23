import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasqueue/domain/model/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> _tasks;

  TaskList(this._tasks);

  @override
  State<StatefulWidget> createState() {
    return _TaskListState(_tasks);
  }
}

class _TaskListState extends State<TaskList> {
  final List<Task> _tasks;

  _TaskListState(this._tasks);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: List.generate(_tasks.length, (index) {
      return TaskItemWidget(_tasks[index]);
    }));
  }
}

class TaskItemWidget extends StatefulWidget {
  final Task _task;

  TaskItemWidget(this._task);

  @override
  State<StatefulWidget> createState() {
    return _TaskItemWidgetState(_task);
  }
}

class _TaskItemWidgetState extends State<TaskItemWidget> {
  final Task _task;

  _TaskItemWidgetState(this._task);

  @override
  Widget build(BuildContext context) {
    return Card(child: Text(_task.title));
  }
}
