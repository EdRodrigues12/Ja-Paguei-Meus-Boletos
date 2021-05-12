import 'package:flutter/material.dart';
import 'package:ja_paguei_meus_boletos/app/ui/credit/credit_page.dart';
import 'package:ja_paguei_meus_boletos/app/ui/financeChannel/finances_channel.dart';
import 'package:ja_paguei_meus_boletos/app/ui/home/home_page.dart';
import 'package:ja_paguei_meus_boletos/app/ui/notifications/notifications_page.dart';
import 'package:ja_paguei_meus_boletos/app/ui/paymentSlip/paymentSlipList/payment_slip_list_page.dart';
import 'package:ja_paguei_meus_boletos/app/ui/paymentSlip/payment_slip_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/newBoleto':
      return MaterialPageRoute(builder: (context) => PaymentSlipPage());
    case '/credit':
      return MaterialPageRoute(builder: (context) => CreditPage());
    case '/financesChannel':
      return MaterialPageRoute(builder: (context) => FinanceChannelPage());
    case '/notifications':
      return MaterialPageRoute(builder: (context) => NotificationsPage());
    case '/listPaymentsSlip':
      return MaterialPageRoute(builder: (context) => PaymentSlipListPage());
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}