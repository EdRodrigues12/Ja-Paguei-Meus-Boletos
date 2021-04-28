import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'file:///C:/Users/Win/IdeaProjects/ja_paguei_meus_boletos/lib/ui/splash/splash_page.dart';
import 'package:ja_paguei_meus_boletos/core/constants/string.dart';

class BoletosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: boletosAppTittle,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: Colors.deepPurple,
          buttonColor: Colors.deepPurple,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple,
            splashColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          ),
          primaryColor: Colors.deepPurpleAccent[400]),
      home: SplashPage(),
    );
  }
}
