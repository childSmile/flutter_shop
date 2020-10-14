import 'package:flutter/material.dart';

import 'package:provide/provide.dart';
import '../provide/counter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'car_detial.dart';
import '../provide/car.dart';


class CarPage extends StatefulWidget {
  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {

  List<String> testList = [];
  String mykey = 'testInfo';

  @override
  Widget build(BuildContext context) {
    
//    _show();
  _getCarInfo();


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: CarDetailPage()

    );

  }

  void _getCarInfo() async {
    await Provide.value<CarProvide>(context).getCarList();
  }



  void _add() async {
//    print('add add  add');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String temp = 'wwwww';
    testList.add(temp);
    prefs.setStringList(mykey, testList);
    _show();
  }

  void _show() async {
//    print('show show  show');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(preferences.getStringList(mykey) != null) {
      setState(() {
        testList = preferences.getStringList(mykey);
      });
    }
  }
  
  void _clear() async {
//    print('clear clear  clear');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(mykey);
    setState(() {
      testList = [];
    });
  }
}

