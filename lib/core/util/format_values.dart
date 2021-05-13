import 'package:intl/intl.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

final MoneyMaskedTextController textMoneyController =
    new MoneyMaskedTextController(
        initialValue: 0.00,
        precision: 2,
        decimalSeparator: ',',
        thousandSeparator: '.',
        leftSymbol: 'R\$ ');

String formatDateBr(dateTime) {
  return DateFormat('dd/MM/yyyy').format(dateTime);
}

String formatMoneyBr(double value) {
  textMoneyController.updateValue(value);
  return textMoneyController.text;
}

DateTime formatDateTime(String date) {
  DateTime parsedDate = DateTime.parse('0001-11-30');

  List<String> validadeSplit = date.split('/');

  if (validadeSplit.length > 1) {
    String day = validadeSplit[0].toString();
    String month = validadeSplit[1].toString();
    String year = validadeSplit[2].toString();

    parsedDate = DateTime.parse('$year-$month-$day');
  }
  return parsedDate;
}
