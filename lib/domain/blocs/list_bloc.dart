import 'package:bloc/bloc.dart';
import 'package:tasqueue/domain/model/task.dart';
import 'package:tasqueue/repository/repository/tasqueue_repository.dart';

import 'list_event.dart';
import 'list_state.dart';


class ListBloc extends Bloc<ListEvent, ListState> {
  final TasqueueRepository repository;

  ListBloc(this.repository) : super(ListInitial());

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    if (event is ListFetched) {
      List<Task> tasks = await repository.getTasks();
      yield ListSuccess(tasks: tasks);
    }
  }
}
