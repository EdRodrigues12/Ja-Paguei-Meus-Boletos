import 'package:ja_paguei_meus_boletos/app/model/payment_slip.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class PaymentSlipDao {

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_description TEXT, '
      '$_date DATETIME, '
      '$_value DOUBLE, '
      '$_parcelas INTEGER)';
  static const String _tableName = 'paymentsSlip';
  static const String _id = 'id';
  static const String _description = 'description';
  static const String _date = 'date';
  static const String _value = 'value';
  static const String _parcelas = 'parcelas';

  Future<int> save(PaymentSlip paymentSlip) async {
    final Database db = await getDatabase(tableSql);
    Map<String, dynamic> paymentSlipMap = _toMap(paymentSlip);
    return db.insert(_tableName, paymentSlipMap);
  }

  Future<List<PaymentSlip>> findAll() async {
    final Database db = await getDatabase(tableSql);
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<PaymentSlip> paymentSlips = _toList(result);
    return paymentSlips;
  }

  Map<String, dynamic> _toMap(PaymentSlip paymentSlip) {
    final Map<String, dynamic> paymentSlipMap = Map();
    paymentSlipMap[_description] = paymentSlip.description;
    paymentSlipMap[_date] = paymentSlip.date;
    paymentSlipMap[_value] = paymentSlip.value;
    paymentSlipMap[_parcelas] = paymentSlip.parcelas;
    return paymentSlipMap;
  }

  List<PaymentSlip> _toList(List<Map<String, dynamic>> result) {
    final List<PaymentSlip> paymentSlips = List();
    for (Map<String, dynamic> row in result) {
      final PaymentSlip paymentSlip = PaymentSlip(
        row[_id],
        row[_description],
        row[_date],
        row[_value],
        row[_parcelas],
      );
      paymentSlips.add(paymentSlip);
    }
    return paymentSlips;
  }
}