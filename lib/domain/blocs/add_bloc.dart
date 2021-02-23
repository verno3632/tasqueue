import 'package:bloc/bloc.dart';
import 'package:tasqueue/domain/model/task.dart';
import 'package:tasqueue/repository/repository/tasqueue_repository.dart';

import 'add_event.dart';
import 'add_state.dart';


class AddBloc extends Bloc<AddEvent, AddState> {
  final TasqueueRepository repository;

  AddBloc(this.repository) : super(Initial());

  @override
  Stream<AddState> mapEventToState(AddEvent event) async* {
    if (event is TaskFetch) {
      yield TaskFetched(EmptyTask());
    }
  }
}
