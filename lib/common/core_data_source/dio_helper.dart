import 'dart:convert';

import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:requests_inspector/requests_inspector.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:simple_deal/common/constants/urls.dart';
import 'package:simple_deal/common/core_data_source/exception.dart';
import 'package:simple_deal/common/logger.dart';
import 'package:simple_deal/features/authentication/data/data_sources/auth_local_data_source.dart';

import '../constants/strings.dart';

part 'dio_helper.g.dart';

@riverpod
Dio client(ClientRef ref) {
  return Dio()
    ..interceptors.add(RequestsInspectorInterceptor())
    ..options.baseUrl = Urls.baseUrl
    ..options.headers = {
      //TODO HEADERS
    };
}

@riverpod
DioHelper dioHelper(DioHelperRef ref) {
  return DioHelper(
    dio: ref.read(clientProvider),
    authLocalDataSource: ref.read(authLocalDataSourceProvider),
  );
}

class DioHelper {
  final Dio dio;
  final IAuthLocalDataSource authLocalDataSource;
  DioHelper({required this.dio, required this.authLocalDataSource});

  Future<Map<String, dynamic>> doPostRequest({
    required String url,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    String? token;
    try {
      token = await authLocalDataSource.getUserToken;
    } catch (_) {}
    if (token != null) {
      dio.options.headers.addAll({"Authorization": token});
    }

    FormData? form;

    if (data != null) {
      form = FormData.fromMap(data);
    }
    return _handleException(
        dio.post(url, data: form ?? data, queryParameters: queryParameters));
  }

  Future<Map<String, dynamic>> doPatchRequest({
    required String url,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    String? token;
    try {
      token = await authLocalDataSource.getUserToken;
    } catch (_) {}
    if (token != null) {
      dio.options.headers.addAll({"Authorization": token});
    }

    FormData? form;

    if (data != null) {
      form = FormData.fromMap(data);
    }
    return _handleException(
        dio.patch(url, data: form ?? data, queryParameters: queryParameters));
  }

  Future<Map<String, dynamic>> doDeleteRequest({
    required String url,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    String? token;
    try {
      token = await authLocalDataSource.getUserToken;
    } catch (_) {}
    if (token != null) {
      dio.options.headers.addAll({"Authorization": token});
    }

    FormData? form;

    if (data != null) {
      form = FormData.fromMap(data);
    }
    return _handleException(
        dio.delete(url, data: form ?? data, queryParameters: queryParameters));
  }

  Future<Map<String, dynamic>> doGetRequest(
      {required String url,
      Map<String, dynamic>? queryParameters,
      dynamic data}) async {
    String? token;
    try {
      token = await authLocalDataSource.getUserToken;
    } catch (_) {}
    if (token != null) {
      dio.options.headers.addAll({"Authorization": token});
    }

    FormData? form;

    if (data != null) {
      form = FormData.fromMap(data);
    }
    return _handleException(
      dio.get(url, data: form ?? data, queryParameters: queryParameters),
    );
  }

  Future<Map<String, dynamic>> _handleException(
      Future<Response<dynamic>> function) async {
    try {
      final response = await function;
      late final Map<String, dynamic> result;
      if (response.data is String) {
        result = jsonDecode(response.data);
      } else {
        result = response.data;
      }
      logger.i(response.realUri);
      logger.wtf(result);
      if (!result.containsKey('statusCode')) {
        return result;
      }
      if (result['statusCode'] == AppStrings.instance.successStatusCode ||
          result['statusCode'] == AppStrings.instance.successStatusCode2) {
        return result;
      }

      if (result['statusCode'] == AppStrings.instance.unAuthorizedStatusCode) {
        throw UnAuthorizedException();
      } else if (result['statusCode'] ==
          AppStrings.instance.unVerifiedStatusCode) {
        throw UnVerifiedException();
      } else {
        late final String errorMessage;
        if (result['message'] is List) {
          errorMessage = result['message'].first;
        } else {
          errorMessage = result['message'];
        }
        throw ServerException(message: errorMessage);
      }
    } on DioError catch (dioError) {
      final responseBody = dioError.response!.data;
      final response = dioError.response!;
      logger.e(response.requestOptions.uri);
      logger.wtf(response);
      logger.wtf(StackTrace.current);

      if (response.statusCode == AppStrings.instance.unAuthorizedStatusCode) {
        throw UnAuthorizedException();
      } else if (response.statusCode ==
          AppStrings.instance.unVerifiedStatusCode) {
        throw UnVerifiedException();
      } else {
        late final String errorMessage;
        if (responseBody['message'] is List) {
          errorMessage = responseBody['message'].first;
        } else {
          errorMessage = responseBody['message'];
        }
        throw ServerException(message: errorMessage);
      }
    } catch (error) {
      await Sentry.captureException(
        error.toString(),
        stackTrace: StackTrace.current,
      );
      rethrow;
    }
  }
}
