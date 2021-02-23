import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tasqueue/domain/blocs/add_bloc.dart';
import 'package:tasqueue/domain/blocs/add_event.dart';
import 'package:tasqueue/domain/blocs/add_state.dart';
import 'package:tasqueue/domain/model/task.dart';
import 'package:tasqueue/repository/repository/tasqueue_repository.dart';
import 'package:test/test.dart';

void main() {
  group('AddBloc', () {
    AddBloc _addBloc;

    setUp(() {
      _addBloc = AddBloc(repo);
    });

    test('initial state is Initial', () {
      expect(_addBloc.state, Initial());
    });

    blocTest("emits when AddEvent.TaskFetch is added",
        build: () => _addBloc,
        act: (bloc) => bloc.add(TaskFetch()),
        expect: [TaskFetched(EmptyTask())]);
  });
}

class MockTasqueueRepository extends Mock implements TasqueueRepository {}

var repo = MockTasqueueRepository();
