import 'package:ja_paguei_meus_boletos/app/database/dao/paid_payment_slip_dao.dart';
import 'package:ja_paguei_meus_boletos/app/model/paid_payment_slip.dart';

class PaidPaymentSlipRepository {
  final PaidPaymentSlipDao _dao = PaidPaymentSlipDao();

  Future<int> save(PaidPaymentSlip paymentSlip) {
    return _dao.save(paymentSlip);
  }

  Future<int> update(PaidPaymentSlip paymentSlip) {
    return _dao.update(paymentSlip);
  }

  Future<PaidPaymentSlip> findId(int id) async {
    return _dao.findId(id);
  }

  Future<List<PaidPaymentSlip>> findAll() async {
    return _dao.findAll();
  }

  Future<List<PaidPaymentSlip>> getPaidPayments() async {
    return _dao.getPaidPayments();
  }
}