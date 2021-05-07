import 'package:ja_paguei_meus_boletos/app/model/payment_slip.dart';
import 'package:ja_paguei_meus_boletos/app/repository/payment_slip_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:ja_paguei_meus_boletos/core/util/format_values.dart';

part 'payment_slip_viewmodel.g.dart';

class PaymentSlipViewModel = _PaymentSlipViewModelBase
    with _$PaymentSlipViewModel;

abstract class _PaymentSlipViewModelBase with Store {
  PaymentSlipRepository repository = PaymentSlipRepository();

  @action
  void save(int id, String description, String date, double value,
      int parcelas, context) {
    if(parcelas == null)
      parcelas = 0;

    PaymentSlip newPaymentSlip =
        PaymentSlip(id, description, date, value, parcelas);
    repository.save(newPaymentSlip).then((id) => Navigator.pop(context));
  }

  @action
  Future<List<PaymentSlip>> getPaymentSlip() async {
    List<PaymentSlip> list = await repository.findAll();
    print(list);
    return list;
  }

  @action
  Future<Map<String, dynamic>> getTotalDebt() async {
    List<PaymentSlip> list = await getPaymentSlip();
    Map<String, dynamic> values;
    var valueMes = 0.00;
    var valueTotal = 0.00;

    for (PaymentSlip payments in list) {
      if (payments.value != null) {
        if (formatDateTime(payments.date).month == DateTime.now().month)
          valueMes = valueMes + (payments.value);

        valueTotal = valueTotal + (payments.value);
      }
    }
    values = {
      'valueMonth': valueMes,
      'valueTotal': valueTotal,
    };
    print('values');
    print(values);
    return values;
  }
}