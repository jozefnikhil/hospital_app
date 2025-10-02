import 'package:flutter/material.dart';

class FormDropdownProvider with ChangeNotifier {
  String? _selectedCity;
  String? _selectedbranch;
  String? _selectedtreatment;

  String? get selectedCity => _selectedCity;
  String? get selectedBranch => _selectedbranch;
  String? get selectedtreatment => _selectedtreatment;

  void setCity(String? city) {
    _selectedCity = city;
    notifyListeners();
  }

  void settreatmentValue(String? id) {
  _selectedtreatment = id; // store id instead of name
  notifyListeners();
}

  void setbranch(String? id) {
    _selectedbranch = id;
    notifyListeners();
  }
}
