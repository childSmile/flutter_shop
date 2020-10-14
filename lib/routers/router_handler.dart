import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../pages/details_page.dart';
import '../models/goods.dart';
import '../pages/car_detial.dart';

//处理器
Handler detailsHandler = Handler(
  //参数格式 固定写法
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
//  print('00000');
//  String g =  params['id'].first;
//    print(g);
//    Goods g = params['good'].first;
    return DetailsPage();


  }
);


Handler CarDetailHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    print('eeeeeeee');
    return CarDetailPage();
  }
);


