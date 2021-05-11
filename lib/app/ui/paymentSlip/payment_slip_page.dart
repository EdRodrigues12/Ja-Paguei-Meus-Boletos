import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:ja_paguei_meus_boletos/app/ui/paymentSlip/payment_slip_viewmodel.dart';
import 'package:ja_paguei_meus_boletos/core/constants/string.dart';
import 'package:ja_paguei_meus_boletos/core/util/format_values.dart';
import 'package:spinner_input/spinner_input.dart';

class PaymentSlipPage extends StatefulWidget {

  @override
  _PaymentSlipPageState createState() => _PaymentSlipPageState();
}

class _PaymentSlipPageState extends State<PaymentSlipPage> {
  double spinner = 0;
  var vm = PaymentSlipViewModel();
  final _formKey = new GlobalKey<FormState>();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final MoneyMaskedTextController _moneyController = new MoneyMaskedTextController(initialValue: 0.00, precision: 2, decimalSeparator: '.', thousandSeparator: '', leftSymbol: 'R\$ ');
  final TextEditingController _parcelasController = TextEditingController();

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
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Nome do boleto',
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: TextFormField(
                      controller: _valueController,
                      style: TextStyle(fontSize: 24.0),
                      decoration: InputDecoration(
                        labelText: 'Boleto',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) return requiredField;
                        return null;
                      },
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
                    child: TextFormField(
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
                          lastDate: DateTime(2100),
                        );
                        _dateController.text = formatDateBr(date);
                      },
                      validator: (value) {
                        if (value.isEmpty) return requiredField;
                        return null;
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
                    child: TextFormField(
                      controller: _moneyController,
                      style: TextStyle(fontSize: 24.0),
                      decoration: InputDecoration(
                        labelText: 'Valor',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value.isEmpty || value == 'R\$ 0.00') return requiredField;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Quantidade de parcelas',
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: SpinnerInput(
                      minValue: 0,
                      maxValue: 60,
                      plusButton: SpinnerButtonStyle(elevation: 0, color: Colors.deepPurple, borderRadius: BorderRadius.circular(0)),
                      minusButton: SpinnerButtonStyle(elevation: 0, color: Colors.deepPurple, borderRadius: BorderRadius.circular(0)),
                      middleNumberWidth: 70,
                      middleNumberStyle: TextStyle(fontSize: 21),
                      spinnerValue: spinner,
                      onChange: (newValue) {
                        setState(() {
                          spinner = newValue;
                          _parcelasController.text = newValue.toInt().toString();
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: FloatingActionButton.extended(
                      label: Text(saveButton),
                      onPressed: () {
                        vm.getPaymentSlip();
                        if (_formKey.currentState.validate()) {
                          final double value =
                              double.tryParse(_moneyController.text.replaceAll(
                            'R\$',
                            '',
                          ));
                          final int parcelas =
                              int.tryParse(_parcelasController.text);

                          vm.save(0, _valueController.text, _dateController.text, value,
                              parcelas, context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
