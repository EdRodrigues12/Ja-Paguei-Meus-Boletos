import 'package:intl/intl.dart';

String formatDateBr(dateTime) {
  return DateFormat('dd/MM/yyyy').format(dateTime);
}