import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

Future getHomePageContent() async{
  try{
    Response response;
    Dio dio = Dio();


    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded") as String;
    var formData = {};
    response = await dio.post(servicePath['homePageContext'],data: formData);
    if(response.statusCode == 200){
      return response.data;
    }else{
      throw Exception('后端接口异常');
    }

  }catch(e){

    return print('error == > ${e}');
  }
}

Future request(String url,dynamic paramters,RequestMethod method)  async {
  try{
    Response response;
    Dio dio = Dio();
    var formData = paramters;
    if(method == RequestMethod.Get) {
      response = await dio.get(url,queryParameters: formData);
    } else {
      response = await dio.post(url,queryParameters: formData);
    }
    if(response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口异常');
    }


  }catch(e){

  }
}

enum RequestMethod {
  Post,
  Get
}

