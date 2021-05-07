// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreditViewModel on _CreditViewModelBase, Store {
  final _$valueAtom = Atom(name: '_CreditViewModelBase.value');

  @override
  double get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$getCreditAsyncAction = AsyncAction('_CreditViewModelBase.getCredit');

  @override
  Future<Credit> getCredit() {
    return _$getCreditAsyncAction.run(() => super.getCredit());
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
