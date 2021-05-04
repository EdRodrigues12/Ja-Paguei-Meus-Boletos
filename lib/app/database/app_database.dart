import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase(String tableSql) async {
  final String path = join(await getDatabasesPath(), 'myboletos.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(tableSql);
    },
    version: 1,
  );
}