// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_slip_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentSlipViewModel on _PaymentSlipViewModelBase, Store {
  final _$updateAsyncAction = AsyncAction('_PaymentSlipViewModelBase.update');

  @override
  Future<void> update(int id, bool paid, dynamic context) {
    return _$updateAsyncAction.run(() => super.update(id, paid, context));
  }

  final _$getPaymentSlipAsyncAction =
      AsyncAction('_PaymentSlipViewModelBase.getPaymentSlip');

  @override
  Future<List<PaymentSlip>> getPaymentSlip() {
    return _$getPaymentSlipAsyncAction.run(() => super.getPaymentSlip());
  }

  final _$getTotalDebtAsyncAction =
      AsyncAction('_PaymentSlipViewModelBase.getTotalDebt');

  @override
  Future<Map<String, dynamic>> getTotalDebt() {
    return _$getTotalDebtAsyncAction.run(() => super.getTotalDebt());
  }

  final _$_PaymentSlipViewModelBaseActionController =
      ActionController(name: '_PaymentSlipViewModelBase');

  @override
  void save(int id, String description, String date, double value, int parcelas,
      dynamic context) {
    final _$actionInfo = _$_PaymentSlipViewModelBaseActionController
        .startAction(name: '_PaymentSlipViewModelBase.save');
    try {
      return super.save(id, description, date, value, parcelas, context);
    } finally {
      _$_PaymentSlipViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
