import 'package:ja_paguei_meus_boletos/app/database/dao/payment_slip_dao.dart';
import 'package:ja_paguei_meus_boletos/app/model/payment_slip.dart';

class PaymentSlipRepository {
  final PaymentSlipDao _dao = PaymentSlipDao();

  Future<int> save(PaymentSlip paymentSlip) {
    return _dao.save(paymentSlip);
  }

  Future<int> update(PaymentSlip paymentSlip) {
    return _dao.update(paymentSlip);
  }

  Future<PaymentSlip> findId(int id) async {
    return _dao.findId(id);
  }

  Future<List<PaymentSlip>> findAll() async {
    return _dao.findAll();
  }

  Future<List<PaymentSlip>> getPaidPayments() async {
    return _dao.getPaidPayments();
  }
}