class TablesDataBase {

  static const String tablePaymentsSlipSql = 'CREATE TABLE IF NOT EXISTS $nameTablePayment('
      '$id INTEGER PRIMARY KEY, '
      '$description TEXT, '
      '$date TEXT, '
      '$value DOUBLE, '
      '$parcelas INTEGER,'
      '$paid BOOLEAN)';

  static const String tableCreditsSql = 'CREATE TABLE IF NOT EXISTS $nameTableCredits('
      '$id INTEGER PRIMARY KEY, '
      '$value DOUBLE)';

  static const String nameTableCredits = 'credits';
  static const String nameTablePayment = 'paymentsSlip';
  static const String id = 'id';
  static const String description = 'description';
  static const String date = 'date';
  static const String value = 'value';
  static const String parcelas = 'parcelas';
  static const String paid = 'paid';
}