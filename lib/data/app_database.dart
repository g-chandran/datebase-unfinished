// Built-in packages
import 'dart:async';
import 'package:path/path.dart';

// Third Party packages
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';

class AppDatabase {
  static final AppDatabase _singleton = AppDatabase._();
  static AppDatabase get instance => _singleton;
  Completer<Database> _dbOpenCompleter;
  // Database _database;
  AppDatabase._();

  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _openDatabase();
    }
    return _dbOpenCompleter.future;
  }

  Future _openDatabase() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final dbPath = join(appDirectory.path, 'demo.db');

    final database = await databaseFactoryIo.openDatabase(dbPath);
    _dbOpenCompleter.complete(database);
  }
}
