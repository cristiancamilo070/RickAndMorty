import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{
  int _selectedMenuOpt=0;
  String _name="cami";

  int get selectedMenuOpt{
    return _selectedMenuOpt;
  }

  set selectedMenuOpt(int i){
    _selectedMenuOpt=i;
    notifyListeners();
  }

  String get name{
    return _name;
  }

  set name(String name){
    _name=name;
    notifyListeners();
  }

}