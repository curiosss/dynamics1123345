import 'package:dio/dio.dart';
import 'package:dynamics/config/app_constants.dart';

import 'connectivity_service.dart';

class NetworkService {
  Dio httpClient = Dio();

  NetworkService(ConnectivityService connectivityInfo) {
    init(connectivityInfo);
  }

  init(ConnectivityService connectivityInfo) {
    httpClient.options.baseUrl = baseUrl;
    httpClient.options.connectTimeout = const Duration(seconds: 60);
    httpClient.options.sendTimeout = const Duration(seconds: 60);
    httpClient.options.receiveTimeout = const Duration(seconds: 60);
    httpClient.options.headers.addAll(
      {
        'Accept-Language': 'tk',
      },
    );

    httpClient.interceptors.add(QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        if (!await connectivityInfo.hasInternetConnection()) {
          await Future.delayed(const Duration(seconds: 1));
          // connectivityInfo.showNoInternetDialog();
          return handler.reject(
            DioException.connectionError(
              requestOptions: options,
              reason: 'No internet',
            ),
          );
        } else {
          return handler.next(options);
        }
      },
    ));
  }

  changeLocale(String locale) {
    httpClient.options.headers['Accept-Language'] = locale;
  }

  setToken(String token) {
    httpClient.options.headers['Authorization'] = 'Bearer $token';
  }

  removeToken() {
    httpClient.options.headers['Authorization'] = null;
  }
}
