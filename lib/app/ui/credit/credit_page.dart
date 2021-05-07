import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ja_paguei_meus_boletos/app/model/credit.dart';
import 'package:ja_paguei_meus_boletos/core/constants/string.dart';
import 'package:ja_paguei_meus_boletos/core/util/format_values.dart';

import 'credit_viewmodel.dart';

class CreditPage extends StatefulWidget {
  @override
  _CreditPageState createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
  final _formKey = new GlobalKey<FormState>();
  var vm = CreditViewModel();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    double safeAreaVertical = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text('Crédito'),
      ),
      body: Builder(
        builder: (context) => Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: orientation == Orientation.portrait
                              ? (screenSize.height - safeAreaVertical) /
                                  100 *
                                  25
                              : (screenSize.height - safeAreaVertical) /
                                  100 *
                                  100,
                          child: Card(
                            color: Colors.grey,
                            elevation: 10,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    dense: true,
                                    leading: SvgPicture.asset(
                                        'assets/svg/Shopping/Dollar.svg',
                                        color: Colors.white),
                                    title: Text(
                                      "Aqui vc pode colocar o crédito disponivel esse mês para o pagamento do seus boletos, podendo ser o seu sálario, investimentos...",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: screenSize.width / 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Observer(
                    builder: (_) => Padding(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                      child: FutureBuilder<Credit>(
                        future: vm.getCredit(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                                'Crédito mês: ' + formatMoneyBr(snapshot.data.value),
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.deepPurple,
                              ),
                              textAlign: TextAlign.left,
                            );
                          } else {
                            return Text(
                              'R\$ 0.00',
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.deepPurple,
                              ),
                              textAlign: TextAlign.left,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                    child: TextFormField(
                      controller: vm.moneyController,
                      style: TextStyle(fontSize: 24.0),
                      decoration: InputDecoration(
                        labelText: 'Valor',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value.isEmpty || value == 'R\$ 0.00')
                          return requiredField;
                        return null;
                      },
                    ),
                  ),
                  Observer(
                    builder: (_) => Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: FloatingActionButton.extended(
                        label: Text(saveButton),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            vm.save(0, context);
                          }
                        },
                      ),
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
