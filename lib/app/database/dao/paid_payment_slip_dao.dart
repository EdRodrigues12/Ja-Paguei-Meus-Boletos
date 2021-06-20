import 'package:ja_paguei_meus_boletos/app/model/paid_payment_slip.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ja_paguei_meus_boletos/app/database/app_database.dart';
import 'package:ja_paguei_meus_boletos/app/database/tables_database.dart';

class PaidPaymentSlipDao {
  final _idPaymentSlip = TablesDataBase.id;
  final _paidPaymentSlip = TablesDataBase.paid;

  Future<int> save(PaidPaymentSlip paidPaymentSlip) async {
    final Database db = await getDatabase();
    Map<String, dynamic> paymentSlipMap = _toMap(paidPaymentSlip);
    return db.insert(TablesDataBase.nameTablePaidPayment, paymentSlipMap);
  }

  Future<int> update(PaidPaymentSlip paidPaymentSlip) async {
    final Database db = await getDatabase();
    final id = paidPaymentSlip.id;
    final String _where = '$_idPaymentSlip = $id';

    Map<String, dynamic> paymentSlipMap = _toMap(paidPaymentSlip);
    return db.update(TablesDataBase.nameTablePaidPayment, paymentSlipMap,
        where: _where);
  }

  Future<List<PaidPaymentSlip>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
    await db.query(TablesDataBase.nameTablePaidPayment);
    List<PaidPaymentSlip> paymentSlips = _toList(result);
    return paymentSlips;
  }

  Future<PaidPaymentSlip> findId(int id) async {
    final Database db = await getDatabase();
    final String _where = '$_idPaymentSlip = $id';
    final result =
    await db.query(TablesDataBase.nameTablePaidPayment, where: _where);
    final paymentSlip = _toModel(result.first);
    return paymentSlip;
  }

  Future<List<PaidPaymentSlip>> getPaidPayments() async {
    final Database db = await getDatabase();
    final String _where = '$_paidPaymentSlip = 1';
    final List<Map<String, dynamic>> result =
    await db.query(TablesDataBase.nameTablePaidPayment, where: _where);
    List<PaidPaymentSlip> paymentSlips = _toList(result);
    return paymentSlips;
  }

  Map<String, dynamic> _toMap(PaidPaymentSlip paymentSlip) {
    final Map<String, dynamic> paymentSlipMap = Map();
    paymentSlipMap[TablesDataBase.description] = paymentSlip.description;
    paymentSlipMap[TablesDataBase.date] = paymentSlip.date;
    paymentSlipMap[TablesDataBase.value] = paymentSlip.value;
    paymentSlipMap[TablesDataBase.parcelas] = paymentSlip.parcelas;
    paymentSlipMap[TablesDataBase.paid] = paymentSlip.paid;
    return paymentSlipMap;
  }

  List<PaidPaymentSlip> _toList(List<Map<String, dynamic>> result) {
    final List<PaidPaymentSlip> paymentSlips = List();
    for (Map<String, dynamic> row in result) {
      final PaidPaymentSlip paymentSlip = PaidPaymentSlip(
        row[TablesDataBase.id],
        row[TablesDataBase.description],
        row[TablesDataBase.date],
        row[TablesDataBase.value],
        row[TablesDataBase.parcelas],
        row[TablesDataBase.paid] == 0 ? false : true,
      );
      paymentSlips.add(paymentSlip);
    }
    return paymentSlips;
  }

  PaidPaymentSlip _toModel(Map<String, dynamic> result) {
    Map<String, dynamic> row = result;
    final PaidPaymentSlip paymentSlip = PaidPaymentSlip(
      row[TablesDataBase.id],
      row[TablesDataBase.description],
      row[TablesDataBase.date],
      row[TablesDataBase.value],
      row[TablesDataBase.parcelas],
      row[TablesDataBase.paid] == 0 ? false : true,
    );
    return paymentSlip;
  }
}
