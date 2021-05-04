import 'package:ja_paguei_meus_boletos/app/model/payment_slip.dart';
import 'package:ja_paguei_meus_boletos/app/repository/payment_slip_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
part 'payment_slip_viewmodel.g.dart';

class PaymentSlipViewModel = _PaymentSlipViewModelBase
    with _$PaymentSlipViewModel;

abstract class _PaymentSlipViewModelBase with Store {
  PaymentSlipRepository repository = PaymentSlipRepository();

  void save(PaymentSlip paymentSlip, context) {
    repository.save(paymentSlip).then((id) => Navigator.pop(context));
  }

  Future<List<PaymentSlip>> getPaymentSlip() async {
    List<PaymentSlip> list = await repository.findAll();
    print(list);
    return list;
  }
}