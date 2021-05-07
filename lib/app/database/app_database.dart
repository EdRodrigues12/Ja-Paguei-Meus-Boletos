import 'package:ja_paguei_meus_boletos/app/database/tables_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'myboletos.db');
  return openDatabase(
    path,
    onCreate: (db, version) async{
      await  db.execute(TablesDataBase.tablePaymentsSlipSql);
      await  db.execute(TablesDataBase.tableCreditsSql);
    },
    version: 1,
  );
}