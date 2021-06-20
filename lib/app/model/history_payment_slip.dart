class HistoryPaymentSlip {
  final int id;
  final String description;
  String date;
  final double value;
  int parcelas;
  bool paid = false;

  HistoryPaymentSlip(
      this.id,
      this.description,
      this.date,
      this.value,
      this.parcelas,
      this.paid,);

  @override
  String toString() {
    return 'PaymentSlip{id: $id, description: $description, date: $date, value: $value, parcelas: $parcelas, paid: $paid}';
  }

  HistoryPaymentSlip.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        description = json['description'],
        date = json['date'],
        value = json['value'],
        parcelas = json['parcelas'],
        paid = json['paid'];

  Map<String, dynamic> toJson() => {
    'description': description,
    'date': date,
    'value': value,
    'parcelas': parcelas,
    'paid': paid,
  };
}