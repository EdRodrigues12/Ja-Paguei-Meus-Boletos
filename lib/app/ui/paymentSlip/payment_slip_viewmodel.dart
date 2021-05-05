import 'package:ja_paguei_meus_boletos/app/model/payment_slip.dart';
import 'package:ja_paguei_meus_boletos/app/repository/payment_slip_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'payment_slip_viewmodel.g.dart';

class PaymentSlipViewModel = _PaymentSlipViewModelBase
    with _$PaymentSlipViewModel;

abstract class _PaymentSlipViewModelBase with Store {
  PaymentSlipRepository repository = PaymentSlipRepository();

  void save(int id, String description, String date, double value,
      int parcelas, context) {
    if(parcelas == null)
      parcelas = 0;

    PaymentSlip newPaymentSlip =
        PaymentSlip(id, description, date, value, parcelas);
    repository.save(newPaymentSlip).then((id) => Navigator.pop(context));
  }

  Future<List<PaymentSlip>> getPaymentSlip() async {
    List<PaymentSlip> list = await repository.findAll();
    return list;
  }
}
