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
  void save(int id, String description, String date, double value, int parcelas,
      context) {
    if (parcelas == null) parcelas = 0;

    PaymentSlip newPaymentSlip =
        PaymentSlip(id, description, date, value, parcelas, false);
    repository.save(newPaymentSlip).then((id) =>
        Navigator.pushNamedAndRemoveUntil(
            context, '/homePage', (route) => false));
  }

  @action
  Future<void> update(int id, bool paid, context) async {
    PaymentSlip paymentSlip = await repository.findId(id);
    var dataPayment = paymentSlip.date;
    var newDataPayment = formatDateTime(dataPayment);
    print(paymentSlip);
    if (paid) {
      if(paymentSlip.parcelas == 0) {
        paymentSlip.parcelas = paymentSlip.parcelas + 1;
      } else {
        paymentSlip.parcelas = paymentSlip.parcelas - 1;
      }
      paymentSlip.paid = paid;
      paymentSlip.date = formatDateBr(newDataPayment.add(new Duration(days: 30)));
      print(paymentSlip);
      repository.update(paymentSlip);
    } else {
      paymentSlip.date = formatDateBr(newDataPayment.add(new Duration(days: -30)));
      paymentSlip.paid = paid;
      paymentSlip.parcelas = paymentSlip.parcelas + 1;
      repository.update(paymentSlip);
    }
  }

  @action
  Future<List<PaymentSlip>> getPaymentSlip() async {
    List<PaymentSlip> list = await repository.findAll();
    return list;
  }

  @action
  Future<List<PaymentSlip>> getPaidPayments() async {
    List<PaymentSlip> list = await repository.getPaidPayments();
    return list;
  }

  @action
  Future<Map<String, dynamic>> getTotalDebt() async {
    List<PaymentSlip> list = await getPaymentSlip();
    Map<String, dynamic> values;
    var valueMes = 0.00;
    var valueTotal = 0.00;

    for (PaymentSlip payments in list) {
      if (payments.value != null && payments.parcelas > 0) {
        if (formatDateTime(payments.date).month == DateTime.now().month)
          valueMes = valueMes + (payments.value);

        valueTotal = valueTotal + (payments.value);
      }
    }
    values = {
      'valueMonth': valueMes,
      'valueTotal': valueTotal,
    };
    return values;
  }

  @action
  Future<Map<String, dynamic>> getAppreciationDebt() async {
    List<PaymentSlip> list = await getPaymentSlip();
    Map<String, dynamic> values;
    var valuePastMonth = 0.00;
    var valueCurrentMonth = 0.00;
    var currentMonth = DateTime.now();
    var pastMonth = DateTime.now().subtract(new Duration(days: 31));

    for (PaymentSlip payments in list) {
      if (payments.value != null && payments.parcelas > 0) {
        if (formatDateTime(payments.date).month == DateTime.now().month) {
          valueCurrentMonth = valueCurrentMonth + (payments.value);
        }

        if(formatDateTime(payments.date).month == DateTime.now().month - 1) {
          valuePastMonth = valuePastMonth + (payments.value);
        }
      }
    }
    values = {
      'valueCurrentMonth': valueCurrentMonth + valuePastMonth,
      'valuePastMonth': valuePastMonth,
      'currentMonth': currentMonth,
      'pastMonth': pastMonth,
    };
    return values;
  }
}
