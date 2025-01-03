import 'dart:async';

import 'package:dio/dio.dart';
import 'package:walki_admin_panel/app/utils/storage/local_storage.dart';

class AuthorizationInterceptor extends InterceptorsWrapper {
  AuthorizationInterceptor({
    required Dio dio,
    required LocalStorage localStorage,
  })  : _dio = dio,
        _localStorage = localStorage;

  final Dio _dio;
  final LocalStorage _localStorage;

  Completer<bool>? _refreshTokensCompleter;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _localStorage.accessToken;
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      if (err.response?.statusCode == 401) {
        throw Exception();
        //   // NOTE: do not process requests after logged out
        //   if (_refreshTokensCompleter != null) {
        //     final refreshedSuccessfully = await _refreshTokensCompleter!.future;
        //     if (!refreshedSuccessfully) {
        //       return;
        //     }
        //   } else {
        //     await _refreshTokens();
        //   }
        //
        //   final newAccessToken = await _localStorage.accessToken;
        //   err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
        //
        //   final response = await _dio.fetch(err.requestOptions);
        //   handler.resolve(response);
      } else {
        handler.reject(err);
      }
    } catch (exception) {
      await _localStorage.clearAccessToken();
    }
  }

// Future<void> _refreshTokens() async {
//   _refreshTokensCompleter = Completer();
//   const url = '${AppConstants.serviceBaseUrl}/auth/refresh-token';
//   final refreshToken = await _localStorage.refreshToken;
//
//   Response<dynamic> response;
//   try {
//     response = await Dio().post(
//       url,
//       data: {'refreshToken': refreshToken},
//     );
//   } catch (error) {
//     _refreshTokensFailed();
//     rethrow;
//   }
//
//   final tokens = RefreshTokenResponse.fromJson(response.data as Map<String, dynamic>);
//   await _localStorage.saveAccessToken(tokens.accessToken);
//   await _localStorage.saveRefreshToken(tokens.refreshToken);
//   _refreshedTokensSuccessfully();
// }
//
// void _refreshedTokensSuccessfully() {
//   _refreshTokensCompleter?.complete(true);
//   _refreshTokensCompleter = null;
// }
//
// void _refreshTokensFailed() {
//   _refreshTokensCompleter?.complete(false);
//   _refreshTokensCompleter = null;
// }
}
