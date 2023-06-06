import 'package:behype_test/core/consts/network/global_api_consts.dart';
import 'package:behype_test/core/consts/network/interceptors/client_id_interceptor.dart';
import 'package:behype_test/core/consts/network/interceptors/response_body_print_interceptor.dart';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  @Named("unsplashDio")
  Dio unsplashDio() {
    final dio = Dio(BaseOptions(baseUrl: GlobalApiConstants.unsplashBaseUrl));
    dio.interceptors
      ..add(ClientIdInterceptor())
      ..add(LogInterceptor(requestBody: true))
      ..add(ResponseBodyPrinterInterceptor());

    return dio;
  }
}
