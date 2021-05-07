class Credit {
  final int id;
  final double value;

  Credit(
      this.id,
      this.value,);

  @override
  String toString() {
    return 'Credit{id: $id, value: $value}';
  }

  Credit.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        value = json['value'];

  Map<String, dynamic> toJson() => {
    'value': value,
  };
}