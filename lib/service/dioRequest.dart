import 'package:dio/dio.dart';

import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';



/*
 * 封装 restful 请求
 *
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */
class DioUtils {
  /// global dio object
  static Dio dio;

  /// default options
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;
  static const String TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxODYifQ.WE8ftM5CEOrvjjzeBR6dtmvU0kg0PnW9kYGcD1SLyuA";

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';


  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
          connectTimeout: 150000,
          receiveTimeout: 150000,
          responseType: ResponseType.json,
          validateStatus: (status) {
            // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
            return true;
          },
          baseUrl: 'https://api.yanhezhineng.cn',
          );

      dio = new Dio(options);
    }

    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }

  ///Get请求
  static void getHttp<T>(
      String url, {
        parameters,
        Function(T) onSuccess,
        Function(String error) onError,
      }) async {
    ///定义请求参数
    parameters = new Map<String, dynamic>.from(parameters);
    parameters = parameters ?? {};

    //参数处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });


    try {
      Response response;
      Dio dio = createInstance();

      var time = DioUtils.currentTimeMillis().toString();
      dio.options.headers = DioUtils.headers(url, time);

      response = await dio.get(url, queryParameters: parameters);
      var responseData = response.data;
      print('${responseData}');
      if (responseData['code'] == 1000) {
        if (onSuccess != null) {
          onSuccess(responseData['result']);
        }
      } else {
        throw Exception('erroMsg:${responseData['erroMsg']}');
      }
      print('响应数据：' + response.toString());
    } catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
    }
  }

  ///Post请求
  static void postHttp<T>(
      String url, {
        parameters,
        Function(T) onSuccess,
        Function(String error) onError,
      }) async {
    ///定义请求参数
    parameters = new Map<String, dynamic>.from(parameters);
    parameters = parameters ?? {};
    //参数处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    try {
      Response response;
      Dio dio = createInstance();
      response = await dio.post(url, queryParameters: parameters);
      var responseData = response.data;
      if (responseData['erroCode'] == 2000) {
        if (onSuccess != null) {
          onSuccess(responseData['result']);
        }
      } else {
        throw Exception('erroMsg:${responseData['erroMsg']}');
      }
      print('响应数据：' + response.toString());
    } catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
    }
  }

  /// request Get、Post 请求
  //url 请求链接
  //parameters 请求参数
  //method 请求方式
  //onSuccess 成功回调
  //onError 失败回调
  static void requestHttp<T>(String url,
      {parameters,
        method,
        Function(T t) onSuccess,
        Function(String error) onError}) async {
    parameters = parameters ?? {};
    method = method ?? 'GET';

    if (method == DioUtils.GET) {
      getHttp(
        url,
        parameters: parameters,
        onSuccess: (data) {
          onSuccess(data);
        },
        onError: (error) {
          onError(error);
        },
      );
    } else if (method == DioUtils.POST) {
      postHttp(
        url,
        parameters: parameters,
        onSuccess: (data) {
          onSuccess(data);
        },
        onError: (error) {
          onError(error);
        },
      );
    }
  }


  static String sign(String url,String time){
    print('url == ${url},time=${time}');
    String str = 'iOS${time}${url}com.health.yanhe1.0.2';
    print('str =${str}');
    var content = new Utf8Encoder().convert('QWERTYUIOPLKMNBVCXZASDFGHJKJHGFEWQQ1234567890OKJHBVCXSWERT${str}');
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }


  static int currentTimeMillis() {
    print(DateTime.now().millisecondsSinceEpoch);
    return (DateTime.now().millisecondsSinceEpoch / 1000).toInt();
  }


  static Map headers (url,time) {

    Map<String, dynamic> httpHeaders = {
      'Accept': 'application/json,*/*',
      'Content-Type': 'application/json',
      'token': DioUtils.TOKEN,
      'x-request-yanhe-api':'iOS',
      'timestamp':time,
      'app-id':'com.health.yanhe',
      'app-version':'1.0.2',
      'app-device-id':'',
      'watch-id':'',
      'timezone':'0',
      'sign':DioUtils.sign(url, time),
    };

    return httpHeaders;
  }
}

///// 自定义Header
//Map<String, dynamic> httpHeaders = {
//  'Accept': 'application/json,*/*',
//  'Content-Type': 'application/json',
//  'token': DioUtils.TOKEN,
//  'x-request-yanhe-api':'iOS',
//  'timestamp':(DioUtils.currentTimeMillis() / 1000),
//  'app-id':'com.health.yanhe',
//  'app-version':'1.0.2',
//  'app-device-id':'',
//  'watch-id':'',
//  'timezone':'0',
//};



