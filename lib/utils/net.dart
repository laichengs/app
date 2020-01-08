import 'package:dio/dio.dart';
import 'package:mjgj/config/global.dart';
import 'dart:convert';

import 'package:mjgj/config/result_code.dart';

class DioManage {
  static final debug = false;

//  static BuildContext context = null;
  //服务器路径
  static final host = '';
  static final baseUrl = 'https://minicdn.meijinguanjia.com/api/';

  Dio dio;
  static DioManage _instance;

  static DioManage getInstance() {
    if (_instance == null) {
      _instance = DioManage();
    }
    return _instance;
  }

  DioManage() {
    dio = new Dio(BaseOptions(
        method: 'get',
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 5000,
        followRedirects: true));
    // 添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
      // 请求被发送之前
      // 如果你想完成请求并返回一些自定义数据,可以返回一个`Response`对象
      // 或返回`dio.resolve(data)`,这样请求将会被终止.
      // 上层then会被调用,then中返回的数据将是你的自定义数据data.
      //
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,
      // 或返回`dio.reject(errMsg)`,这样请求将被中止并触发异常,上层catchError会被调用.
      onRequest: (RequestOptions options) {
        if (GlobalConfig.isDebug) {
          print("\n================== 请求数据 ==========================");
          print("url = ${options.uri.toString()}");
          print("headers = ${options.headers}");
          print("params = ${options.data}");
          print("params = ${options.method}");
          print("\n=====================================================");
        }
        return options; //continue
      },
      // 返回响应数据之前
      onResponse: (Response response) {
        if (GlobalConfig.isDebug) {
          print("\n================== 响应数据 ==========================");
          print("code = ${response.statusCode}");
          print("data = ${response.data}");
          print("\n=====================================================");
        }
        return response; // continue
      },
      // 请求失败之前
      onError: (DioError e) {
        if (GlobalConfig.isDebug) {
          print("\n================== 错误响应数据 ======================");
          print("type = ${e.type}");
          print("message = ${e.message}");
          print("\n=====================================================");
        }
        return e; // continue
      },
    ));
  }

//get请求
  get(String url, Map<String, dynamic> params) async {
    return _requstHttp(url, 'get', params);
  }

  //post请求
  post(String url, params) async {
    return _requstHttp(url, "post", params);
  }

  _requstHttp(String url, [String method, Map<String, dynamic> params]) async {
    Response response;
    try {
      if (method == 'get') {
        if (params != null) {
          response = await dio.get(url, queryParameters: params);
        } else {
          response = await dio.get(url);
        }
      } else if (method == 'post') {
        if (params != null) {
          response = await dio.post(url, data: params);
        } else {
          response = await dio.post(url);
        }
      }
    } on DioError catch (error) {
      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      // 请求超时
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = ResultCode.CONNECT_TIMEOUT;
      }
      // 一般服务器错误
      else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = ResultCode.RECEIVE_TIMEOUT;
      }

      // debug模式才打印
      if (GlobalConfig.isDebug) {
        print('请求异常: ' + error.toString());
        print('请求异常url: ' + url);
        print('请求头: ' + dio.options.headers.toString());
        print('method: ' + dio.options.method);
      }
      return '';
    }
    // debug模式打印相关数据
    if (GlobalConfig.isDebug) {
      print('请求url: ' + url);
      print('请求头: ' + dio.options.headers.toString());
      if (params != null) {
        print('请求参数: ' + params.toString());
      }
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
    }
    String dataStr = json.encode(response.data);
    Map<String, dynamic> dataMap = json.decode(dataStr);
    if (dataMap['error'] != 0) {
      print("ERROR" + dataMap['msg']);
    } else {
      return dataMap['data'];
    }
    return dataMap['data'];
  }
}
