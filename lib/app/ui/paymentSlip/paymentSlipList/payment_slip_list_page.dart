import 'package:flutter/material.dart';
import 'package:ja_paguei_meus_boletos/app/model/payment_slip.dart';
import 'package:ja_paguei_meus_boletos/core/util/format_values.dart';
import 'package:ja_paguei_meus_boletos/core/constants/string.dart';
import 'package:flutter_svg/svg.dart';
import '../payment_slip_viewmodel.dart';

class PaymentSlipListPage extends StatefulWidget {
  @override
  _PaymentSlipListPageState createState() => _PaymentSlipListPageState();
}

class _PaymentSlipListPageState extends State<PaymentSlipListPage> {
  final vmPayment = PaymentSlipViewModel();
  var _paymentsSlipList;
  List<bool> _checkPaid;
  bool _paidPayment = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text( !_paidPayment ? 'Boletos' : 'Qual boleto foi pago'),
      ),
      body: Builder(
        builder: (context) => Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(16),
          child: FutureBuilder<List<PaymentSlip>>(
            future: vmPayment.getPaymentSlip(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _paymentsSlipList = snapshot.data;
                return ListView.separated(
                  separatorBuilder: (context, i) => Divider(
                    height: 0,
                    thickness: 2,
                    color: Colors.white,
                  ),
                  itemBuilder: (context, i) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ListTile(
                            tileColor: Colors.grey[100],
                            leading: !_paidPayment ? SvgPicture.asset(
                              'assets/svg/Shopping/Wallet3.svg',
                              color: Colors.brown[400],
                              width: screenSize.width / 9,
                            ) : Checkbox(
                              value: _checkPaid[i],
                              onChanged: (bool newValue) {
                                setState(() {
                                  _checkPaid[i] = newValue;
                                });
                              },
                            ),
                            title: Text(
                              snapshot.data[i].description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: screenSize.width / 23,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              formatMoneyBr(snapshot.data[i].value),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () async {},
                            trailing: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    vencimento + snapshot.data[i].date,
                                  ),
                                  Text(
                                    parcelas +
                                        snapshot.data[i].parcelas.toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                );
              } else {
                return Center(
                  child: Text(
                    luck,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurpleAccent[400],
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(Icons.payments_sharp),
                tooltip: "Boletos",
                color: Colors.white,
                onPressed: () {
                  setState(() {
                  _paidPayment = false;
                  });
                }),
            IconButton(
                icon: Icon(Icons.money_off),
                tooltip: "Meus boletos pagos",
                color: Colors.white,
                onPressed: () {}),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Opacity(
        opacity: 0.8,
        child: new FloatingActionButton(
          onPressed: () async {
            setState(() {
            _checkPaid = new List.generate(_paymentsSlipList.length, (_) => false);
            _paidPayment = true;
            });
            //Navigator.popAndPushNamed(context, '/paidPayments', arguments: _paymentsSlipList);
          },
          child: Icon(Icons.money_sharp),
          tooltip: "Pagar",
        ),
      ),
    );
  }
}
