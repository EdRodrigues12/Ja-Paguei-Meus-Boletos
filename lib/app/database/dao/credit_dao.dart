import 'package:ja_paguei_meus_boletos/app/database/tables_database.dart';
import 'package:ja_paguei_meus_boletos/app/model/credit.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ja_paguei_meus_boletos/app/database/app_database.dart';

class CreditDao {

  final _idCredits = TablesDataBase.id;

  Future<int> save(Credit credit) async {
    final Database db = await getDatabase();
    Map<String, dynamic> creditMap = _toMap(credit);
    return db.insert(TablesDataBase.nameTableCredits, creditMap);
  }

  Future<int> update(Credit credit) async {
    final Database db = await getDatabase();
    final id = credit.id;
    final String _where = '$_idCredits = $id';

    Map<String, dynamic> creditMap = _toMap(credit);
    return db.update(TablesDataBase.nameTableCredits, creditMap, where: _where);
  }

  Future<List<Credit>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(TablesDataBase.nameTableCredits);
    List<Credit> credits = _toList(result);
    return credits;
  }

  Future<Credit> findId(int id) async {
    final Database db = await getDatabase();
    final String _where = 'where: $_idCredits = $id';
    final result = await db.query(TablesDataBase.nameTableCredits, where: _where);
    final credits = _toModel(result.first);
    return credits;
  }

  Map<String, dynamic> _toMap(Credit credit) {
    final Map<String, dynamic> creditMap = Map();
    creditMap[TablesDataBase.value] = credit.value;
    return creditMap;
  }

  List<Credit> _toList(List<Map<String, dynamic>> result) {
    final List<Credit> credits = List();
    for (Map<String, dynamic> row in result) {
      final Credit credit = Credit(
        row[TablesDataBase.id],
        row[TablesDataBase.value],
      );
      credits.add(credit);
    }
    return credits;
  }

  Credit _toModel(Map<String, dynamic> result) {
    Map<String, dynamic> row = result;
      final Credit credit = Credit(
        row[TablesDataBase.id],
        row[TablesDataBase.value],
      );
    return credit;
  }
}