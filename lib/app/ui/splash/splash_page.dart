import 'package:flutter/material.dart';
import 'package:ja_paguei_meus_boletos/app/ui/home/home_page.dart';
import 'package:ja_paguei_meus_boletos/core/constants/dimens.dart';
import 'package:ja_paguei_meus_boletos/core/constants/string.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Material(
    child: Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 3,
          navigateAfterSeconds: HomePage(),
          backgroundColor: Colors.deepPurple,
          loaderColor: Colors.deepPurple,
        ),
        Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: sixteen,),
              Text(
                splashScreenText,
                style: TextStyle(
                  fontSize: thirtyTwo,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}