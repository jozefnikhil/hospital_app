import 'package:flutter/material.dart';

class PatientCountProvider extends ChangeNotifier {
  final Map<int, int> _counts = {}; // key = rowIndex, value = count

  void initRow(int index) {
    _counts[index] ??= 0;
  }

  int getCount(int index) => _counts[index] ?? 0;

  void increment(int index) {
    _counts[index] = (_counts[index] ?? 0) + 1;
    notifyListeners();
  }

  void decrement(int index) {
    if ((_counts[index] ?? 0) > 0) {
      _counts[index] = (_counts[index] ?? 0) - 1;
      notifyListeners();
    }
  }

  // Helper getters for convenience
  int get maleCount => getCount(0);
  int get femaleCount => getCount(1);

  // Optional: get as string if API expects string values
  String get maleCountStr => maleCount.toString();
  String get femaleCountStr => femaleCount.toString();
}
