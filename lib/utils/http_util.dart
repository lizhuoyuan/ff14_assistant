/*
 * author: Created by 李卓原 on 2019/3/20.
 * email: zhuoyuan93@gmail.com
 *
 */

/*
 * Created by 李卓原 on 2018/9/15.
 * email: zhuoyuan93@gmail.com
 * 网络请求封装
 */

import 'package:dio/dio.dart';

class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  BaseOptions options;

  static HttpUtil getInstance() {
    if (instance == null) {
      instance = HttpUtil();
    }
    return instance;
  }

  HttpUtil() {
    // 或者通过传递一个 `options`来创建dio实例
    options = BaseOptions(
      // 请求基地址,可以包含子路径，如: "https://www.google.com/api/".
      baseUrl: "http://rap2api.taobao.org/app/mock/162762/",
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,

      ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
      ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
      ///  注意: 这并不是接收数据的总时限.
      receiveTimeout: 3000,
      headers: {},
    );
    dio = new Dio(options);
  }

  get(url, {data, options, cancelToken}) async {
    print('get请求启动! url：$url ,body: $data');
    Response response;
    try {
      response = await dio.get(
        url,
        queryParameters: data,
        cancelToken: cancelToken,
      );
      print('get请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      }
      print('get请求发生错误：$e');
    }
    return response.data;
  }

  post(url, {data, options, cancelToken}) async {
    print('post请求启动! url：$url ,body: $data');
    Response response;
    try {
      response = await dio.post(
        url,
        data: data,
        cancelToken: cancelToken,
      );
      print('post请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      }
      print('post请求发生错误：$e');
    }
    return response.data;
  }
}
