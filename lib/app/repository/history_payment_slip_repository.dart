import 'package:ja_paguei_meus_boletos/app/database/dao/history_payment_slip_dao.dart';
import 'package:ja_paguei_meus_boletos/app/model/history_payment_slip.dart';

class HistoryPaymentSlipRepository {
  final HistoryPaymentSlipDao _dao = HistoryPaymentSlipDao();

  Future<int> save(HistoryPaymentSlip paymentSlip) {
    return _dao.save(paymentSlip);
  }

  Future<int> update(HistoryPaymentSlip paymentSlip) {
    return _dao.update(paymentSlip);
  }

  Future<HistoryPaymentSlip> findId(int id) async {
    return _dao.findId(id);
  }

  Future<List<HistoryPaymentSlip>> findAll() async {
    return _dao.findAll();
  }

  Future<List<HistoryPaymentSlip>> getPaidPayments() async {
    return _dao.getPaidPayments();
  }
}