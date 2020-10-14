import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'router_handler.dart';

class Routes {
  static String root = '/'; //配置根目录
  static String detailsPage = '/detail'; //详情页面
  static String carDetailsPage = '/car_detail'; //详情页面

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context,Map<String,List<String>> params) {
      print('error --- router was nor found');
    });
    router.define(detailsPage, handler: detailsHandler);
  }
}
