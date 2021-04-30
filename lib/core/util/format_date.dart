import 'package:intl/intl.dart';

String formatDate(dateTime) {
  return DateFormat('dd/MM/yyyy').format(dateTime);
}