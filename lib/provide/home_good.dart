import 'package:flutter/material.dart';
import 'package:flutter_app_shop/models/goods.dart';

class HomeSelectGoodProvide with ChangeNotifier {
  Goods selectGood;

  int current = 0;

  changeLeftAngRight(int index) {
    current = index;
    notifyListeners();
  }

  getGood(good) {
    selectGood = good;
    notifyListeners();
  }
}
