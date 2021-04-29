import 'package:flutter/material.dart';

class PaymentSlipPage extends StatelessWidget {
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _moneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo boleto'),
      ),
      body: Builder(
        builder: (context) => Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Nome do boleto',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: TextField(
                  controller: _valueController,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(
                    labelText: 'Boleto',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Data do vencimento',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: TextField(
                  controller: _dateController,
                  readOnly: true,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(
                    labelText: 'Data',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onTap: () async {
                    var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    _dateController.text = date.toString().substring(0, 10);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Valor do boleto',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: TextField(
                  controller: _moneyController,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(
                    labelText: 'Valor',
                    prefix: Text('R\$'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
