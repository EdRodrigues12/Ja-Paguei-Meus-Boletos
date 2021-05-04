class PaymentSlip {
  final int id;
  final String description;
  final DateTime date;
  final double value;
  final int parcelas;

  PaymentSlip(
      this.id,
        this.description,
        this.date,
        this.value,
        this.parcelas,);

  @override
  String toString() {
    return 'PaymentSlip{id: $id, description: $description, date: $date, value: $value, parcelas: $parcelas}';
  }

  PaymentSlip.fromJson(Map<String, dynamic> json)
    : id = json['id'],
    description = json['description'],
    date = json['date'],
    value = json['value'],
    parcelas = json['parcelas'];

  Map<String, dynamic> toJson() => {
        'description': description,
        'date': date,
        'value': value,
        'parcelas': parcelas,
      };
}