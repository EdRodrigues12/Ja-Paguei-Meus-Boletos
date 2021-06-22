import 'package:ja_paguei_meus_boletos/app/model/history_payment_slip.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ja_paguei_meus_boletos/app/database/app_database.dart';
import 'package:ja_paguei_meus_boletos/app/database/tables_database.dart';

class HistoryPaymentSlipDao {
  final _idPaymentSlip = TablesDataBase.id;
  final _paidPaymentSlip = TablesDataBase.paid;

  Future<int> save(HistoryPaymentSlip paidPaymentSlip) async {
    final Database db = await getDatabase();
    Map<String, dynamic> paymentSlipMap = _toMap(paidPaymentSlip);
    return db.insert(TablesDataBase.nameTableHistoryPayment, paymentSlipMap);
  }

  Future<int> update(HistoryPaymentSlip paidPaymentSlip) async {
    final Database db = await getDatabase();
    final id = paidPaymentSlip.id;
    final String _where = '$_idPaymentSlip = $id';

    Map<String, dynamic> paymentSlipMap = _toMap(paidPaymentSlip);
    return db.update(TablesDataBase.nameTableHistoryPayment, paymentSlipMap,
        where: _where);
  }

  Future<List<HistoryPaymentSlip>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
    await db.query(TablesDataBase.nameTableHistoryPayment);
    List<HistoryPaymentSlip> paymentSlips = _toList(result);
    return paymentSlips;
  }

  Future<HistoryPaymentSlip> findId(int id) async {
    final Database db = await getDatabase();
    final String _where = '$_idPaymentSlip = $id';
    final result =
    await db.query(TablesDataBase.nameTableHistoryPayment, where: _where);
    final paymentSlip = _toModel(result.first);
    return paymentSlip;
  }

  Future<List<HistoryPaymentSlip>> getPaidPayments() async {
    final Database db = await getDatabase();
    final String _where = '$_paidPaymentSlip = 1';
    final List<Map<String, dynamic>> result =
    await db.query(TablesDataBase.nameTableHistoryPayment, where: _where);
    List<HistoryPaymentSlip> paymentSlips = _toList(result);
    return paymentSlips;
  }

  Map<String, dynamic> _toMap(HistoryPaymentSlip paymentSlip) {
    final Map<String, dynamic> paymentSlipMap = Map();
    paymentSlipMap[TablesDataBase.description] = paymentSlip.description;
    paymentSlipMap[TablesDataBase.date] = paymentSlip.date;
    paymentSlipMap[TablesDataBase.createDate] = paymentSlip.createDate;
    paymentSlipMap[TablesDataBase.value] = paymentSlip.value;
    paymentSlipMap[TablesDataBase.parcelas] = paymentSlip.parcelas;
    paymentSlipMap[TablesDataBase.paid] = paymentSlip.paid;
    return paymentSlipMap;
  }

  List<HistoryPaymentSlip> _toList(List<Map<String, dynamic>> result) {
    final List<HistoryPaymentSlip> paymentSlips = List();
    for (Map<String, dynamic> row in result) {
      final HistoryPaymentSlip paymentSlip = HistoryPaymentSlip(
        row[TablesDataBase.id],
        row[TablesDataBase.description],
        row[TablesDataBase.date],
        row[TablesDataBase.createDate],
        row[TablesDataBase.value],
        row[TablesDataBase.parcelas],
        row[TablesDataBase.paid] == 0 ? false : true,
      );
      paymentSlips.add(paymentSlip);
    }
    return paymentSlips;
  }

  HistoryPaymentSlip _toModel(Map<String, dynamic> result) {
    Map<String, dynamic> row = result;
    final HistoryPaymentSlip paymentSlip = HistoryPaymentSlip(
      row[TablesDataBase.id],
      row[TablesDataBase.description],
      row[TablesDataBase.date],
      row[TablesDataBase.createDate],
      row[TablesDataBase.value],
      row[TablesDataBase.parcelas],
      row[TablesDataBase.paid] == 0 ? false : true,
    );
    return paymentSlip;
  }
}
