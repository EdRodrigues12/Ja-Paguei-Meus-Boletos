import 'package:ja_paguei_meus_boletos/app/database/dao/payment_slip_dao.dart';
import 'package:ja_paguei_meus_boletos/app/model/payment_slip.dart';

class PaymentSlipRepository {
  final PaymentSlipDao _dao = PaymentSlipDao();

  Future<int> save(PaymentSlip paymentSlip) {
    return _dao.save(paymentSlip);
  }

  Future<List<PaymentSlip>> findAll() async {
    return _dao.findAll();
  }
}