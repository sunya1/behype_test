import 'package:behype_test/core/consts/network/global_api_consts.dart';
import 'package:behype_test/main.dart';
import 'package:dio/dio.dart';

class ClientIdInterceptor extends InterceptorsWrapper {
  ClientIdInterceptor();
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Accept'] = 'application/json';

    options.headers["Authorization"] =
        "Client-ID ${GlobalApiConstants.clientID}";
    options.followRedirects = false;
    logger.d("************************************************");
    logger.d(options.headers.toString());

    return super.onRequest(options, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) async {
    logger.d("************************************************");
    logger.d(err);

    super.onError(err, handler);
  }
}