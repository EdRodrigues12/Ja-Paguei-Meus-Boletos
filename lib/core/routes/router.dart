import 'package:flutter/material.dart';
import 'package:ja_paguei_meus_boletos/ui/home/home_page.dart';
import 'package:ja_paguei_meus_boletos/ui/paymentSlip/payment_slip_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/newBoleto':
      return MaterialPageRoute(builder: (context) => PaymentSlipPage());
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}