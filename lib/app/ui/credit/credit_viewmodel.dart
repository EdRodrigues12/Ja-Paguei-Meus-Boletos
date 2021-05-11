import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:ja_paguei_meus_boletos/app/model/credit.dart';
import 'package:ja_paguei_meus_boletos/app/repository/credit_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
part 'credit_viewmodel.g.dart';

class CreditViewModel = _CreditViewModelBase
    with _$CreditViewModel;

abstract class _CreditViewModelBase with Store {
  CreditRepository creditRepository = new CreditRepository();

  @observable
  double value;

  MoneyMaskedTextController moneyController =
  new MoneyMaskedTextController(initialValue: 0.00, precision: 2, decimalSeparator: '.', thousandSeparator: '', leftSymbol: 'R\$ ');

  void save(int id, context) async {
    value = double.tryParse(moneyController.text.replaceAll('R\$', ''));
    Credit newCredit = Credit(id, value);
    if(await getCredit() == null) {
      creditRepository.save(newCredit).then((id) => Navigator.pop(context));
    } else {
      Credit credit = await getCredit();
      value = value + (credit.value);
      newCredit = Credit(credit.id, value);
      creditRepository.update(newCredit).then((id) => Navigator.pop(context));
    }
  }

  @action
  Future<Credit> getCredit() async {
    List<Credit> list = await creditRepository.findAll();
    // if(list.isEmpty)
    //   value = 0;
    // else
    //   value = list.first.value;
    if(list.isEmpty || list == null)
      return null;
    return list.first;
  }

}
//command mobx build
//flutter packages pub run build_runner build --delete-conflicting-outputs