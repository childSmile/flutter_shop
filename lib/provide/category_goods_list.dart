import 'package:flutter/material.dart';
import '../models/goods.dart';

class CategoryGoodsListProvide with ChangeNotifier {
  List goodsList = [];

  getGoodsList(List list) {
    if (list == null) {
      list = [];
    }

    goodsList = list;
    notifyListeners();
  }
}
