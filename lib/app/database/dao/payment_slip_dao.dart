import 'package:ja_paguei_meus_boletos/app/model/payment_slip.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ja_paguei_meus_boletos/app/database/app_database.dart';
import 'package:ja_paguei_meus_boletos/app/database/tables_database.dart';

class PaymentSlipDao {
  final _idPaymentSlip = TablesDataBase.id;
  final _paidPaymentSlip = TablesDataBase.paid;

  Future<int> save(PaymentSlip paymentSlip) async {
    final Database db = await getDatabase();
    Map<String, dynamic> paymentSlipMap = _toMap(paymentSlip);
    return db.insert(TablesDataBase.nameTablePayment, paymentSlipMap);
  }

  Future<int> update(PaymentSlip paymentSlip) async {
    final Database db = await getDatabase();
    final id = paymentSlip.id;
    final String _where = '$_idPaymentSlip = $id';

    Map<String, dynamic> paymentSlipMap = _toMap(paymentSlip);
    return db.update(TablesDataBase.nameTablePayment, paymentSlipMap,
        where: _where);
  }

  Future<List<PaymentSlip>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(TablesDataBase.nameTablePayment);
    print(result);
    List<PaymentSlip> paymentSlips = _toList(result);
    return paymentSlips;
  }

  Future<PaymentSlip> findId(int id) async {
    final Database db = await getDatabase();
    final String _where = '$_idPaymentSlip = $id';
    final result =
        await db.query(TablesDataBase.nameTablePayment, where: _where);
    print(result);
    final paymentSlip = _toModel(result.first);
    return paymentSlip;
  }

  Future<List<PaymentSlip>> getPaidPayments() async {
    final Database db = await getDatabase();
    final String _where = '$_paidPaymentSlip = 1';
    final List<Map<String, dynamic>> result =
    await db.query(TablesDataBase.nameTablePayment, where: _where);
    print(result);
    List<PaymentSlip> paymentSlips = _toList(result);
    return paymentSlips;
  }

  Map<String, dynamic> _toMap(PaymentSlip paymentSlip) {
    final Map<String, dynamic> paymentSlipMap = Map();
    paymentSlipMap[TablesDataBase.description] = paymentSlip.description;
    paymentSlipMap[TablesDataBase.date] = paymentSlip.date;
    paymentSlipMap[TablesDataBase.value] = paymentSlip.value;
    paymentSlipMap[TablesDataBase.parcelas] = paymentSlip.parcelas;
    paymentSlipMap[TablesDataBase.paid] = paymentSlip.paid;
    return paymentSlipMap;
  }

  List<PaymentSlip> _toList(List<Map<String, dynamic>> result) {
    final List<PaymentSlip> paymentSlips = List();
    for (Map<String, dynamic> row in result) {
      final PaymentSlip paymentSlip = PaymentSlip(
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

  PaymentSlip _toModel(Map<String, dynamic> result) {
    Map<String, dynamic> row = result;
    final PaymentSlip paymentSlip = PaymentSlip(
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
