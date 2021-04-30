import 'package:flutter/material.dart';
import 'package:ja_paguei_meus_boletos/ui/home/home_page.dart';
import 'package:ja_paguei_meus_boletos/ui/paymentSlip/payment_slip_page.dart';
import 'package:ja_paguei_meus_boletos/ui/credit/credit_page.dart';
import 'package:ja_paguei_meus_boletos/ui/financeChannel/finances_channel.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/newBoleto':
      return MaterialPageRoute(builder: (context) => PaymentSlipPage());
    case '/credit':
      return MaterialPageRoute(builder: (context) => CreditPage());
    case '/financesChannel':
      return MaterialPageRoute(builder: (context) => FinanceChannelPage());
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}