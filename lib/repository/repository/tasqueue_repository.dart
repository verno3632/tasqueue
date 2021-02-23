import 'package:tasqueue/domain/model/task.dart';

abstract class TasqueueRepository {

  Future<List<Task>> getTasks();
}