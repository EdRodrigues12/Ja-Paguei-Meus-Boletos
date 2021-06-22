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

  static const String tablePaidPaymentsSlipSql = 'CREATE TABLE IF NOT EXISTS $nameTablePaidPayment('
      '$id INTEGER PRIMARY KEY, '
      '$description TEXT, '
      '$date TEXT, '
      '$value DOUBLE, '
      '$parcelas INTEGER,'
      '$paid BOOLEAN)';

  static const String tableHistoryPaymentsSlipSql = 'CREATE TABLE IF NOT EXISTS $nameTableHistoryPayment('
      '$id INTEGER PRIMARY KEY, '
      '$description TEXT, '
      '$date TEXT, '
      '$createDate TEXT, '
      '$value DOUBLE, '
      '$parcelas INTEGER,'
      '$paid BOOLEAN)';

  static const String nameTableCredits = 'credits';
  static const String nameTablePayment = 'paymentsSlip';
  static const String nameTablePaidPayment = 'paidPaymentsSlip';
  static const String nameTableHistoryPayment = 'historyPaymentsSlip';
  static const String id = 'id';
  static const String description = 'description';
  static const String date = 'date';
  static const String createDate = 'createDate';
  static const String value = 'value';
  static const String parcelas = 'parcelas';
  static const String paid = 'paid';
}