import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {

  navigatorPage(_currentIndex, context) {
    switch (_currentIndex) {
      case 0:
        Navigator.pushNamed(context, '/newBoleto');
        break;
      case 1:
        Navigator.pushNamed(context, '/credit');
        break;
      case 2:
        Navigator.pushNamed(context, '/financesChannel');
        break;
    }
  }

}

