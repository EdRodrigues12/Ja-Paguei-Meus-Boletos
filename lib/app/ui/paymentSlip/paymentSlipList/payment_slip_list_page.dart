import 'package:flutter/material.dart';
import 'package:ja_paguei_meus_boletos/app/model/payment_slip.dart';
import 'package:ja_paguei_meus_boletos/core/util/format_values.dart';

import '../payment_slip_viewmodel.dart';

class PaymentSlipListPage extends StatefulWidget {
  @override
  _PaymentSlipListPageState createState() => _PaymentSlipListPageState();
}

class _PaymentSlipListPageState extends State<PaymentSlipListPage> {
  final vmPayment = PaymentSlipViewModel();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Boletos'),
      ),
      body: Builder(
        builder: (context) => Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(16),
          child: FutureBuilder<List<PaymentSlip>>(
            future: vmPayment.getPaymentSlip(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
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
                              title: Text(
                                snapshot.data[i].description,
                              ),
                              subtitle: Text(
                                  formatMoneyBr(snapshot.data[i].value),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              onTap: () async {

                              }),
                        ],
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                );
              } else {
                return Center(
                  child: Text(
                    'Que sorte você ainda não possui dividas!!!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
