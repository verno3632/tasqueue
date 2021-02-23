import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:tasqueue/domain/model/task.dart';

import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListInitial());

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    if (event is ListFetched) {
      List<Task> tasks = [Task("ブログを1文字でも書かない"), Task("運動をする")];
      yield ListSuccess(tasks: tasks);
    }
  }
}
