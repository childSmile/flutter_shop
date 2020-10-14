import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provide/provide.dart';
import '../models/goods.dart';
import 'dart:convert';

class CarProvide with ChangeNotifier {
  String carString = '';
  String carKey = 'carInfo';
  List<CarInfoModel> carList = [];

  save(goodId, goodName, count, price, images) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    carString = preferences.get(carKey);
    List temp = carString == null ? [] : json.decode(carString);
    List<Map> tempList = temp.cast<Map>(); //把temp转化为list

    print('add before tempList = ${tempList}');
    bool isHave = false;
    int ival = 0; //foreach 循环索引
    tempList.forEach((item) {
      if (item['goodId'] == goodId) {
        tempList[ival]['count'] = item['count'] + 1;
        carList[ival].count++;
        isHave = true;
      }
      ival++;
    });

    if (!isHave) {
      Map<String, dynamic> newGoods = {
        'goodId': goodId,
        'goodsName': goodName,
        'count': count,
        'price': price,
        'images': images
      };
      tempList.add(newGoods);
      carList.add(CarInfoModel.formJson(newGoods));
      print('${newGoods}');
    }

    print(' after add tempList = ${tempList}');
    print(carList);

    carString = json.encode(tempList).toString();
    print(carString);
    preferences.setString(carKey, carString);

    getCarList();

    notifyListeners();
  }

  remove() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(carKey);
    carList = [];
    print('clear all');

    getCarList();

    notifyListeners();
  }

  add(CarInfoModel model) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    carString = preferences.get(carKey);
    List temp = carString == null ? [] : json.decode(carString);
    List<Map> tempList = temp.cast<Map>(); //把temp转化为list

    print('add before tempList = ${tempList}');
    bool isHave = false;

    for (var i = 0; i < tempList.length; i++) {
      var item = tempList[i];
      if (item['goodsId'] == model.goodsId) {
        item['count'] = model.count + 1;
        isHave = true;
        break;
      }
    }
    if (!isHave) {
      tempList.add(model.toJson());
      carList.add(CarInfoModel.formJson(model));
    }

    carString = json.encode(tempList).toString();
    preferences.setString(carKey, carString);

    print('delete' + '${carString}');
    getCarList();
    notifyListeners();
  }

  delete(CarInfoModel model) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    carString = preferences.get(carKey);
    List temp = carString == null ? [] : json.decode(carString);
    List<Map> tempList = temp.cast<Map>(); //把temp转化为list

    print('delete before tempList = ${tempList}');
    bool isHave = false;

    for (var i = 0; i < tempList.length; i++) {
      var item = tempList[i];
      if (item['goodsId'] == model.goodsId) {
        item['count'] = model.count - 1;
        if (item['count'] == 0) {
//          isHave = true;
          tempList.remove(item);
          break;
        }
      }
    }

//    if (isHave) {
//      print('333');
//      tempList.remove(model.toJson());
//    }
    carString = json.encode(tempList).toString();
    preferences.setString(carKey, carString);

    print('delete' + '${carString}');
    getCarList();
    notifyListeners();
  }

  getCarList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    carString = preferences.get(carKey);
    List temp = carString == null ? [] : json.decode(carString);
    List<Map> tempList = temp.cast<Map>();
    carList = tempList.map((e) {
      return CarInfoModel.formJson(e);
    }).toList();

    notifyListeners();
  }
}
