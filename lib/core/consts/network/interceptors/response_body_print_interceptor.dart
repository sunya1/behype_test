import 'package:behype_test/main.dart';
import 'package:dio/dio.dart';

/// интерцептор кототрый логирует запросы
class ResponseBodyPrinterInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
     logger.d(options.data);

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(response.data);
    super.onResponse(response, handler);
  }
}