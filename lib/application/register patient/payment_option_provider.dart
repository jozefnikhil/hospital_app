import 'package:flutter/material.dart';

class PaymentOptionProvider extends ChangeNotifier {
  String _selectedPaymentOption = 'Cash';

  String get selectedPaymentOption => _selectedPaymentOption;

  void setPaymentOption(String option) {
    _selectedPaymentOption = option;
    notifyListeners();
  }

  void resetPaymentOption() {
    _selectedPaymentOption = 'Cash';
    notifyListeners();
  }
}