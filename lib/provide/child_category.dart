import 'package:flutter/material.dart';
import '../models/goods.dart';

class ChildCategory with ChangeNotifier {
  List childCategoryList = [];
  int childIndex = 0;
  int categoryType = 0;

  getChildCategory(list, type) {
    if (list == null) {
      childCategoryList = [];
    }

    categoryType = type;
    childIndex = 0;
    CatregoryModel all = CatregoryModel(name: '全部');
    childCategoryList = [all];

    childCategoryList.addAll(list);
    notifyListeners();
  }

  changeChildIndex(index) {
    childIndex = index;
    notifyListeners();
  }
}
