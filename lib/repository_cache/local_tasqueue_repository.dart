import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:tasqueue/domain/model/task.dart';
import "package:tasqueue/repository/repository/tasqueue_repository.dart";
import 'package:path/path.dart' as p;

class LocalTasqueueRepository extends TasqueueRepository {

  Future<Database> open() async {
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = p.join(dir.path, 'tasks.db');
    return await databaseFactoryIo.openDatabase(dbPath);
  }

  @override
  Future<List<Task>> getTasks() async {
    final store = stringMapStoreFactory.store('tasks');
    final db = await open();
    final results = await store.find(db);
    return results.map((e) => Task.fromJson(e.value));
  }
}