class PaymentSlip {
  final int id;
  final String description;
  final String date;
  final double value;
  final int parcelas;
  bool paid = false;

  PaymentSlip(
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

  PaymentSlip.fromJson(Map<String, dynamic> json)
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